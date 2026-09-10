#!/bin/bash
set -euo pipefail

repo_raw="https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main"
install_dir="${1:-/vhs2}"
work_dir="${NEWCDNBEST_WORK_DIR:-/tmp}"

if [ "$(id -u)" -ne 0 ]; then
    echo "请使用 root 运行此脚本" >&2
    exit 1
fi

if [ ! -x "$install_dir/cbmaster/bin/cbmaster" ]; then
    echo "$install_dir 不是有效的主控安装目录" >&2
    exit 1
fi

if [ -z "$work_dir" ] || [ "$work_dir" = "/" ]; then
    echo "临时目录无效" >&2
    exit 1
fi

mkdir -p "$work_dir"
cd "$work_dir"
rm -rf "$work_dir/cdnbest-master"
rm -f "$work_dir/im.sh" \
      "$work_dir/cdnbest-master.tar.gz.001" \
      "$work_dir/cdnbest-master.tar.gz.002"

wget --timeout=30 --tries=3 "$repo_raw/install/im.sh" -O im.sh
bash -e im.sh 4.6.16
bash ./cdnbest-master/shell/update.sh "$install_dir"
