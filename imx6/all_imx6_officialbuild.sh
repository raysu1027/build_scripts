#!/bin/bash
echo "[ADV] DATE = ${DATE}"
echo "[ADV] STORED = ${STORED}"
echo "[ADV] VERSION = ${VERSION}"
echo "[ADV] BUILD_NUMBER = ${BUILD_NUMBER}"
echo "[ADV] REALEASE_NOTE = $Release_Note"

echo "[ADV] FTP_DIR = $FTP_DIR"
echo "[ADV] DOWNLOADS = $DOWNLOADS"

echo "[ADV] BSP_URL = $BSP_URL"
echo "[ADV] BSP_BRANCH = $BSP_BRANCH"

echo "[ADV] U_BOOT_VERSION = $U_BOOT_VERSION"
echo "[ADV] U_BOOT_URL = $U_BOOT_URL"
echo "[ADV] U_BOOT_BRANCH = $U_BOOT_BRANCH"
echo "[ADV] U_BOOT_PATH = $U_BOOT_PATH"

echo "[ADV] KERNEL_VERSION = $KERNEL_VERSION"
echo "[ADV] KERNEL_URL = $KERNEL_URL"
echo "[ADV] KERNEL_BRANCH = $KERNEL_BRANCH"
echo "[ADV] KERNEL_PATH = $KERNEL_PATH"

echo "[ADV] META_ADVANTECH_URL = $META_ADVANTECH_URL"
echo "[ADV] META_ADVANTECH_PATH = $META_ADVANTECH_PATH"
echo "[ADV] META_ADVANTECH_BRANCH = $META_ADVANTECH_BRANCH"

echo "[ADV] DEPLOY_IMAGE_NAME = $DEPLOY_IMAGE_NAME"

echo "[ADV] MFGTOOLS_URL = $MFGTOOLS_URL"
echo "[ADV] MFGTOOLS_BRANCH = $MFGTOOLS_BRANCH"

NUM1=`expr $VERSION : 'V\([0-9]*\)'`
NUM2=`expr $VERSION : '.*[.]\([0-9]*\)'`
VERSION_NUM=$NUM1$NUM2

#[x11]
#imx6_BSP
./imx6_officialbuild.sh imx6 imx6LBV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee imx6LBV"$VERSION_NUM"_$DATE.log
#imx6_projects
if [ $UBC220A1_SOLO == true ]; then
	./imx6_officialbuild.sh ubc220a1-solo U220A1LIV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee U220A1LIV"$VERSION_NUM"_DualLiteSolo_$DATE.log
fi
if [ $UBCDS31A1 == true ]; then
	./imx6_officialbuild.sh ubcds31a1 DS31A1LIV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee DS31A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $ROM5420A1 == true ]; then
	./imx6_officialbuild.sh rom5420a1 5420A1LIV"$VERSION_NUM" 1G-2G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 5420A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $ROM5420B1_SOLO == true ]; then
	./imx6_officialbuild.sh rom5420b1-solo 5420B1LIV"$VERSION_NUM" 512M $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 5420B1LIV"$VERSION_NUM"_DualLiteSolo_$DATE.log
fi
if [ $ROM5420B1 == true ]; then
	./imx6_officialbuild.sh rom5420b1 5420B1LIV"$VERSION_NUM" 1G-2G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 5420B1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $RSB4410A1 == true ]; then
	./imx6_officialbuild.sh rsb4410a1 4410A1LIV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 4410A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $RSB4410A2 == true ]; then
	./imx6_officialbuild.sh rsb4410a2 4410A2LIV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 4410A2LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $RSB4411A1 == true ]; then
	./imx6_officialbuild.sh rsb4411a1 4411A1LIV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 4411A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $ROM7420A1 == true ]; then
	./imx6_officialbuild.sh rom7420a1 7420A1LIV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 7420A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $ROM3420A1 == true ]; then
	./imx6_officialbuild.sh rom3420a1 3420A1LIV"$VERSION_NUM" 1G-2G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 3420A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $ROM7421A1_PLUS == true ]; then
	./imx6_officialbuild.sh rom7421a1-plus 7421A1LIV"$VERSION_NUM" 1G-2G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 7421A1LIV"$VERSION_NUM"_DualQuad_$DATE.log
fi
if [ $ROM7421A1_SOLO == true ]; then
	./imx6_officialbuild.sh rom7421a1-solo 7421A1LIV"$VERSION_NUM" 1G $DATE $STORED x11 $VERSION_NUM 2>&1 |tee 7421A1LIV"$VERSION_NUM"_DualLiteSolo_$DATE.log
fi

cp *.log $STORED/$DATE/
