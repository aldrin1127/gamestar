#!/bin/bash -e
rm -rf aosptree
cp -r aosptree-tpl aosptree
cd aosptree
./gamestar-ci/generate.sh
