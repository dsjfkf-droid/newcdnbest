#!/bin/bash
set -euo pipefail

repo_root=$(cd "$(dirname "$0")/.." && pwd)
test_root=$(mktemp -d /tmp/newcdnbest-wrapper-test.XXXXXX)
trap 'rm -rf "$test_root"' EXIT

fake_bin="$test_root/bin"
log_file="$test_root/commands.log"
mkdir -p "$fake_bin"

cat > "$fake_bin/wget" <<'EOF'
#!/bin/bash
printf 'wget %s\n' "$*" >> "$NEWCDNBEST_TEST_LOG"
EOF

cat > "$fake_bin/bash" <<'EOF'
#!/bin/bash
printf 'bash %s\n' "$*" >> "$NEWCDNBEST_TEST_LOG"
EOF

cat > "$fake_bin/id" <<'EOF'
#!/bin/bash
if [ "${1:-}" = "-u" ]; then
    echo 0
else
    /usr/bin/id "$@"
fi
EOF

chmod +x "$fake_bin/wget" "$fake_bin/bash" "$fake_bin/id"
export PATH="$fake_bin:$PATH"
export NEWCDNBEST_TEST_LOG="$log_file"

install_target="$test_root/new-install"
NEWCDNBEST_WORK_DIR="$test_root/install-work" \
    /bin/bash "$repo_root/install/master-4.7.25.sh" 10086 "$install_target"

grep -Fx "wget --timeout=30 --tries=3 https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main/install/im.sh -O im.sh" "$log_file"
grep -Fx "bash -e im.sh 4.7.25" "$log_file"
grep -Fx "bash ./cdnbest-master/shell/install.sh 10086 $install_target" "$log_file"

: > "$log_file"
downgrade_target="$test_root/existing-install"
mkdir -p "$downgrade_target/cbmaster/bin"
touch "$downgrade_target/cbmaster/bin/cbmaster"
chmod +x "$downgrade_target/cbmaster/bin/cbmaster"
NEWCDNBEST_WORK_DIR="$test_root/downgrade-work" \
    /bin/bash "$repo_root/install/master-4.7.25-to-4.6.16.sh" "$downgrade_target"

grep -Fx "wget --timeout=30 --tries=3 https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main/install/im.sh -O im.sh" "$log_file"
grep -Fx "bash -e im.sh 4.6.16" "$log_file"
grep -Fx "bash ./cdnbest-master/shell/update.sh $downgrade_target" "$log_file"

if NEWCDNBEST_WORK_DIR="$test_root/guard-work" \
    /bin/bash "$repo_root/install/master-4.7.25.sh" 10086 "$downgrade_target" >/dev/null 2>&1; then
    echo "fresh install accepted an existing destination" >&2
    exit 1
fi

if NEWCDNBEST_WORK_DIR="$test_root/guard-work" \
    /bin/bash "$repo_root/install/master-4.7.25-to-4.6.16.sh" "$test_root/missing" >/dev/null 2>&1; then
    echo "version switch accepted a missing installation" >&2
    exit 1
fi

echo "install wrapper tests passed"
