#!/usr/bin/python
if 0:
	suffix = '.tar.gz'

	import os
	L = os.listdir('.')
	for file in L:
		if file[file.find(suffix):] == suffix:
			tarball = file
			from ftplib import FTP
			ftp = FTP('ftp-upload.gnu.org')
			ftp.set_debuglevel(2)
			ftp.login()
			ftp.cwd('incoming/ftp')
			for f in [tarball, tarball+'.sig',tarball+'.directive.asc']:
				ftp.storbinary('STOR '+f, open(f, 'rb'))
			ftp.quit()
			break
	else:
		print 'no tarball found'
else:
	print "This is not tested, and may be broken. Don't use."	