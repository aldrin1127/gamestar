#!/bin/bash
cd aosptree
./gamestar-patches/apply.sh
if [ "$2" == "gsroot" ]; then
    ./gamestar-patches/apply-rooted.sh
fi

