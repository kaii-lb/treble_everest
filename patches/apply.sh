#!/bin/bash

set -e

patches="$(readlink -f -- $1)"
tree="$2"
patches="${patches}/treblestuff"

echo patchesDir $patches

if [[ $3 == "--reset" ]]; then
	for project in $(cd $patches/patches/$tree; echo *); do
	   p="$(tr _ / <<<$project |sed -e 's;platform/;;g')"
	   [ "$p" == build ] && p=build/make
	   [ "$p" == treble/app ] && p=treble_app
	   [ "$p" == vendor/hardware/overlay ] && p=vendor/hardware_overlay    
	   echo directory is $p
	   pushd $p &>/dev/null

		heads=$(git show-ref)

		if echo $heads | grep -e "remotes/.*/everest" &>/dev/null;then
			headLong=$(echo $heads | grep -e "remotes/.*/everest")
			headshort=$(echo $headLong | cut -f3-4 -d'/' | cut -f1 -d" ")
			# echo needed rev is $headshort
			git reset --hard $headshort
			echo
		elif echo $heads | grep -e "remotes/.*/m/qpr3" &>/dev/null;then
			headLong=$(echo $heads | grep -e "remotes/.*/m/qpr3")
			headshort=$(echo $headLong | cut -f3-4 -d'/' | cut -f1 -d" ")
			# echo needed rev is $headshort
			git reset --hard $headshort
			echo
		elif echo $heads | grep -e "remotes/.*/crdroid" &>/dev/null;then
			headLong=$(echo $heads | grep -e "remotes/.*/crdroid")
			headshort=$(echo $headLong | cut -f3-4 -d'/' | cut -f1 -d" ")
			# echo needed rev is$headshort
			git reset --hard $headshort
			echo
		fi

	   popd &>/dev/null
	done
elif [[ $tree == *"/"* ]]; then
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
       		echo "PATCH $(echo $patch | cut -f9 -d"/") SUCCEEDED!"
       		echo
       	else
       		echo "PATCH $(echo $patch | cut -f9 -d"/") FAILED, skipping..."
       		git am --skip
#       	    exit 1
			echo
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
	       	   echo
	       	else
	       	   echo "PATCH ${project} FAILED, skipping..."
	       	   git am --skip
	       	   echo
	     	fi
	    done
	    popd &>/dev/null
	done
fi

