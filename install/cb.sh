#/bin/sh
export CDNBEST_VERSION="4.6.4"
export KANGLE_VERSION="3.5.21.16"


OS="6"
if [ -f /usr/bin/systemctl ] ; then
        OS="7"
        if [ -f /usr/bin/dnf ] ; then
                OS="8"
        fi
fi
if test `arch` != "x86_64"; then
	echo "only support arch x86_64..."
	exit 1
fi
export ARCH="$OS-x64"
export DOWNLOAD_PREFIX="https://raw.githubusercontent.com/dsjfkf-droid/newcdnbest/main/cdnbest"
if ! test $1 ; then
     echo "Error: Please input cdnbest uid"
     exit 1
fi
export CB_UID=$1
cd /tmp/
wget --no-check-certificate $DOWNLOAD_PREFIX/cdnbest-$CDNBEST_VERSION-$ARCH.tar.gz -O cdnbest.tar.gz
ret=$?
if [ $ret != 0 ] ; then
	echo "cann't download file"
	exit $ret
fi
tar xzf cdnbest.tar.gz
cd cdnbest
./shell/install.sh $CB_UID
\cp -f /vhs/kangle/bin/autoupdate /vhs/kangle/bin/autoupdate.bak
rm -rf /vhs/kangle/bin/autoupdate


~						68 text #/bin/sh
~							70 text export CDNBEST_VERSION = "4.6.4"
~							72 text export KANGLE_VERSION = "3.5.21.16"
~							74 text OS = "6"
~							76 text if  [  -f  /usr/bin/systemctl ] ;  then
~							78 text OS = "7"
~							80 text if  [  -f  /usr/bin/dnf ] ;  then
~							82 text OS = "8"
~						83 container
+							84 text fi
+						85 text fi
~							87 text if  test `arch` !=  "x86_64" ;  then
~							89 text 	echo  "only support arch x86_64..."
~						90 container
+							91 text exit 1
~						92 text fi
~						93 container
+							94 text export ARCH = " $OS -x64"
~						95 container
+							96 text export DOWNLOAD_PREFIX = "http://github.itzmx.com/1265578519/cdnbest/main/cdnbest"
~							98 text if  ! test  $1  ;  then
~							100 text      echo  "Error: Please input cdnbest uid"
~							102 text exit 1
~						103 text fi
+						104 container
+							105 text export CB_UID = $1
+						106 text cd /tmp/
~							108 text wget  --no -check -certificate $DOWNLOAD_PREFIX /cdnbest- $CDNBEST_VERSION - $ARCH .tar.gz  -O  cdnbest.tar.gz
~						109 container
+							110 text ret = $?
+						111 container
+							112 text if  [  $ret  !=  0  ] ;  then
+						113 container
+							114 text 	echo  "cann't download file"
+						115 container
+							116 text exit $ret
~						117 text fi
~						118 text tar xzf cdnbest.tar.gz
+						119 text cd cdnbest
~							121 text ./shell/install.sh  $CB_UID
+						122 container
+							123 text \cp  -f  /vhs/kangle/bin/autoupdate /vhs/kangle/bin/autoupdate.bak
+						124 container
+							125 text rm  -rf  /vhs/kangle/bin/autoupdate
+				126 container focus-trap-help-panel
+					127 text Use 
+					128 text Control + Shift + m
+					129 text  to toggle the 
+					130 text tab
+					131 text  key moving focus. Alternatively, use 
+					132 text esc
+					133 text  then 
+					134 text tab
+					135 text  to move to the next interactive element on the page.
The focused UI element is 67 text entry area (settable) Editing cb.sh file contents Use Control + Shift + m to toggle the tab key moving focus. Alternatively, use esc then tab to move to the next interactive element on the page., Value: #/bin/sh
export CDNBEST_VERSION="4.6.4"
export KANGLE_VERSION="3.5.21.16"


OS="6"
if [ -f /usr/bin/systemctl ] ; then
        OS="7"
        if [ -f /usr/bin/dnf ] ; then
                OS="8"
        fi
fi
if test `arch` != "x86_64"; then
	echo "only support arch x86_64..."
	exit 1
fi
export ARCH="$OS-x64"
export DOWNLOAD_PREFIX="http://github.itzmx.com/1265578519/cdnbest/main/cdnbest"
if ! test $1 ; then
     echo "Error: Please input cdnbest uid"
     exit 1
fi
export CB_UID=$1
cd /tmp/
wget --no-check-certificate $DOWNLOAD_PREFIX/cdnbest-$CDNBEST_VERSION-$ARCH.tar.gz -O cdnbest.tar.gz
ret=$?
if [ $ret != 0 ] ; then
	echo "cann't download file"
	exit $ret
fi
tar xzf cdnbest.tar.gz
cd cdnbest
./shell/install.sh $CB_UID
\cp -f /vhs/kangle/bin/autoupdate /vhs/kangle/bin/autoupdate.bak
rm -rf /vhs/kangle/bin/autoupdate
