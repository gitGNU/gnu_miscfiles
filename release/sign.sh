#!/bin/bash
TARBALL=`ls *.tar.gz`
cp directive $TARBALL.directive
gpg -b $TARBALL
gpg --clearsign $TARBALL.directive
