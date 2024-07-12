#!/bin/bash

set -e

patches="$(readlink -f -- $1)"
tree="$2"
patches="${patches}/treblestuff"

echo patchesDir $patches

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
