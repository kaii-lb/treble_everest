#!/bin/bash

set -e

patches="$(readlink -f -- $1)"
tree="$2"
patches="${patches}/treblestuff"

echo patchesDir $patches

if [[ $tree == *"pickedout/"* ]]; then
	cutDir="$(echo $tree | cut -d"/" -f2)"
	echo $cutDir
	cdDir="$(tr _ / <<<$cutDir |sed -e 's;platform/;;g')"
	pushd $cdDir &>/dev/null
	if [[ $? != 0 ]];then
		echo "cdDir doesn't exist! failing..."
		exit 1
	fi

	for patch in $patches/patches/$tree/*.patch; do
        if git am $patch; then
       	   echo "PATCH ${patch} SUCCEEDED!"
       	else
       	   echo "PATCH $(echo $patch | cut -f2 -d"/") FAILED, skipping..."
       	   git am --skip
#       	   exit 1
     	fi
    done
    popd &>/dev/null
else
	for project in $(cd $patches/patches/$tree; echo *); do
	    p="$(tr _ / <<<$project |sed -e 's;platform/;;g')"
	    [ "$p" == build ] && p=build/make
	    [ "$p" == treble/app ] && p=treble_app
	    [ "$p" == vendor/hardware/overlay ] && p=vendor/hardware_overlay    
	    echo directory is $p
	    pushd $p &>/dev/null
	    for patch in $patches/patches/$tree/$project/*.patch; do
	        if git am $patch; then
	       	   echo "PATCH ${project} SUCCEEDED!"
	       	else
	       	   echo "PATCH ${project} FAILED, skipping..."
	       	   git am --skip
	     	fi
	    done
	    popd &>/dev/null
	done
fi

