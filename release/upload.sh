#!/bin/bash
TARBALL=`ls *.tar.gz`
echo anonymous > ftp-input
echo cd incoming/ftp >> ftp-input
echo binary >> ftp-input
echo prompt >> ftp-input
echo hash >> ftp-input
echo put ${TARBALL}.sig >> ftp-input 
echo put ${TARBALL}.directive.asc >> ftp-input 
echo put ${TARBALL} >> ftp-input 
echo quit >> ftp-input
ftp -v ftp-upload.gnu.org < ftp-input
