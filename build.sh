#!/bin/bash

# Bei ARCH
#Env=`echo $PS1|cut -f1 -d \[`
#if [ "$Env" != "(venv)" ]
#then echo "Setup virtualenv"
#virtualenv2 venv
#source venv/bin/activate
#else echo "Already in virtualenv python2"
#fi
#


#BUILD_VER="mv-L"
#export LOCALVERSION="_"`echo $BUILD_VER`
export PATH=$PATH:/media/Datengrab/home/mv/android/Projekt/AOSP-L/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin
export CROSS_COMPILE=arm-linux-androideabi-
export ARCH=arm
export SUBARCH=arm
export INSTALL_MOD_PATH=/system

    read -p ".config neu?: " ANSWER
		case $ANSWER in
		  j*|J*|y*|Y*) make mv_mako_defconfig ;;

				  *) echo "Ok. dann nicht" ;;
		esac

DATE_START=$(date +"%s")

make -j4

DATE_END=$(date +"%s")
echo
DIFF=$(($DATE_END - $DATE_START))
echo "Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
