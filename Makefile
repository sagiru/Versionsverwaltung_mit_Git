#
# Makefile to handle subfolder makes
#
#
# Author: Sascha Girrulat <sascha@girrulat.de>
#
#
VERSION=$(shell grep version src/version.tex | sed 's/\\newcommand{\\version}{Version //g;s/}//')

all: setup pdf

tag:
	git tag -s "release/lecture-${VERSION}" -m "tagging release/lecture-${VERSION}"

setup:
	cd src; make setup

pdf: keynote
	cd src; make pdf

keynote:
	libreoffice --convert-to pdf keynote/keynote.odp --outdir target

clean:
	cd src; make clean
	rm tmp tasks -Rf

.PHONY: keynote
