# newcdnbest

## 节点重启

```bash
service cdnbest restart
```

## 主控重启

```bash
if command -v systemctl >/dev/null 2>&1; then systemctl restart cbmaster; else bash /vhs2/cbmaster/shell/stop.sh && bash /vhs2/boot.sh; fi
```

## 4.6.16 主控安装（UID 10086）

```bash
yum -y install wget && cd /tmp && wget https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main/install/im.sh -O im.sh && bash -e im.sh 4.6.16 && bash ./cdnbest-master/shell/install.sh 10086 /vhs2
```

## 4.7.25 主控安装（UID 10086）

```bash
yum -y install wget && cd /tmp && wget https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main/install/master-4.7.25.sh -O master-4.7.25.sh && bash master-4.7.25.sh
```

## 4.7.25 切换为 4.6.16

```bash
yum -y install wget && cd /tmp && wget https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main/install/master-4.7.25-to-4.6.16.sh -O master-4.7.25-to-4.6.16.sh && bash master-4.7.25-to-4.6.16.sh
```

## CB 节点安装（UID 10086）

```bash
yum -y install wget && cd /tmp && wget https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main/install/cb.sh -O cb.sh && bash cb.sh 10086
```
