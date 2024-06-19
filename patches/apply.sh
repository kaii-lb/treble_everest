#!/usr/bin/env bash

set -e

# patches=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
patches=$(realpath treblestuff/patches)
tree="$2"

echo "Applying ${tree} patches:"

for project in $(cd "$patches"/"$tree"; echo *); do
    p="$(tr _ / <<<"$project" |sed -e 's;platform/;;g')"
    [ "$p" == build ] && p=build/make
    [ "$p" == treble/app ] && p=treble_app
    [ "$p" == vendor/hardware/overlay ] && p=vendor/hardware_overlay
    [ "$p" == vendor/partner/gms ] && p=vendor/partner_gms
    pushd "$p" &>/dev/null
    # git am --abort
    # rm -rf .git/rebase-apply
    for patch in "$patches"/"$tree"/"$project"/*.patch; do
        git apply "$patch" -v || exit
    done
    popd &>/dev/null
done
