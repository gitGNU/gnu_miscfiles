# Generated automatically from Makefile.in by configure.
# Generated automatically from Makefile.in by configure.
# Makefile for GNU miscfiles
#   Copyright (C) 1996 Free Software Foundation, Inc.
#   Written by Michael I. Bushnell, p/BSG.
#
#   This file is part of the GNU miscfiles.
#
#   GNU miscfiles are free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License as
#   published by the Free Software Foundation; either version 2, or (at
#   your option) any later version.
#
#   GNU miscfiles is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111, USA.

SHELL=/bin/sh

srcdir = .

INSTALL=/usr/local/gnubin/install -c
INSTALL_DATA=${INSTALL} -m 644

prefix=/usr/local

datadir=$(prefix)/share
infodir=$(prefix)/info

MKINSTALLDIRS = $(srcdir)/mkinstalldirs
MAKEINFO = makeinfo

version=1.1

dictfiles=connectives web2 web2a propernames
miscfiles=airport ascii birthtoken inter.phone na.phone operator zipcodes \
	abbrevs.talk abbrevs.gen cities.dat postal.codes GNU-manifesto \
	mailinglists languages latin1
statefiles=us-constitution us-declaration
rfcfiles=rfc-index.txt std-index.txt fyi-index.txt
infofiles=jarg400.info tasks.info
texisource=tasks.texi

distfiles=$(dictfiles) $(miscfiles) $(statefiles) $(rfcfiles) $(infofiles) \
	$(texisource) \
	Makefile.in configure dict-README \
	configure.in mkinstalldirs install-sh ORIGIN README INSTALL \
	NEWS

all:

install: installdirs
	for i in $(dictfiles); do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(datadir)/dict/$$i ; \
	done
	$(INSTALL_DATA) $(srcdir)/dict-README $(datadir)/dict/README
	rm -f $(datadir)/dict/words
	ln $(datadir)/dict/web2 $(datadir)/dict/words
	for i in $(miscfiles); do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(datadir)/misc/$$i ; \
	done
	for i in $(statefiles); do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(datadir)/state/$$i ; \
        done
	for i in $(rfcfiles); do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(datadir)/rfc/$$i ; \
	done
	for i in $(infofiles); do \
	  $(INSTALL_DATA) $(srcdir)/$$i $(infodir)/$$i ; \
	done

install-strip: install

uninstall:
	for i in $(dictfiles); do \
	  rm -f $(datadir)/dict/$$i ; \
	done
	rm -f $(datadir)/dict/README $(datadir)/dict/words
	for i in $(miscfiles); do \
	  rm -f $(datadir)/misc/$$i ; \
	done
	for i in $(statefiles); do \
	  rm -f $(datadir)/state/$$i ; \
        done
	for i in $(rfcfiles); do \
	  rm -f $(datadir)/rfc/$$i ; \
	done
	for i in $(infofiles); do \
	  rm -f $(infodir)/$$i ; \
	done

installdirs:
	$(MKINSTALLDIRS) $(datadir)/dict $(datadir)/misc $(datadir)/state \
		$(datadir)/rfc $(infodir)

Makefile: Makefile.in config.status
	$(SHELL) config.status

config.status: configure
	$(srcdir)/configure --no-create

dist: $(distfiles)
	rm -rf miscfiles-$(version)
	mkdir miscfiles-$(version)
	ln $(distfiles) miscfiles-$(version)
	tar -cho --gzip -f miscfiles-$(version).tar.gz miscfiles-$(version)
	rm -rf miscfiles-$(version)

mostlyclean:
clean:
TAGS:
info:
dvi:
check:

maintainer-clean distclean:
	rm -f Makefile config.status config.cache config.log

# Rules

tasks.info: tasks.texi
	$(MAKEINFO) $< -o $(srcdir)/$@
