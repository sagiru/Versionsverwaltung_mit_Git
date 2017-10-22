#
# Makefile to handle pdf generation and syntax checks
#
#
# Author: Sascha Girrulat <sascha@girrulat.de>
#
#
PDF=$(SOURCE:tex=pdf)
export TEXMFHOME=$(PWD)/texmf
UNAME_S := $(shell uname -s)

ifeq ($(SOURCE),)
	SOURCE=main.tex
endif

all: setup pdf

SKIP_CLEANUP?=0

pdf: ${PDF} clean move

move:
	mkdir ../target -p
	mv ${PDF} ../target/

setup: install setup_tex

clean_all: clean
	rm $(RM) count *.pdf

clean:
	test $(SKIP_CLEANUP) -ne 1 && $(RM) count \
		*.blg \
		*.fdb_latexmk \
		*.dvi \
		*.fls \
		*.bbl \
		*.id* \
		*.lo* \
		*.fdb \
		*.gl* \
		*.nlo \
		*.ind \
		*.ilg \
		*.tex~ \
		*.ist \
		*.toc \
		*.run.xml \
		*.bcf \
		*.out \
		content/*.aux \
		includes/*.aux \
		*.aux || echo "Skip cleanup, pls do make clean manually."

install:
ifeq ($(UNAME_S),Linux)
	sudo apt-get install texlive-latex-recommended \
											texlive-extra-utils \
											texlive-latex-extra \
											texlive-lang-german \
											pandoc \
											texlive-latex-base \
											texlive-bibtex-extra \
											latexmk \
											texlive-generic-extra \
											biber
endif
ifeq ($(UNAME_S),FreeBSD)
	@echo ---
	@echo Notice: Update missing software as root via
	@echo pkg install latex-mk
	@echo pkg install latex-biber
	@echo pkg install tex-dvipsk
	@echo ---
endif

setup_tex: setup
	texhash $(TEXMFHOME)
	sudo mktexlsr

${PDF}: ${SOURCE} Makefile
	latexmk -r .latexmk.rc -f -bibtex -pdf -bibtex-cond ${SOURCE}

.PHONY: src clean
