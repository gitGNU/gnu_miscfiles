#!/bin/bash
set -e
rm *.tar.gz* ../*.tar.gz -f
cd ..
make dist
cd release
mv ../*.tar.gz .
