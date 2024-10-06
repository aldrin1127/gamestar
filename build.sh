#!/bin/bash
pushd aosptree
./gamestar-patches/apply.sh
if [ "$2" == "gsroot" ]; then
    ./gamestar-patches/apply-gsroot.sh
fi
popd
