#!/bin/bash
TARBALL=`ls *.tar.gz`
scp $TARBALL ${TARBALL}.sig ${TARBALL}.directive.asc upload.sh fencepost.gnu.org:
