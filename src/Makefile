#
# Makefile to handle pdf generation and syntax checks
#
#
# Author: Sascha Girrulat <sascha@girrulat.de>
#
#

SOURCE=Versionsverwaltung_mit_Git.tex
MAIN=$(SOURCE:.tex=)
PDF=$(SOURCE:tex=pdf)
export TEXMFHOME=$(PWD)/texmf
UNAME_S := $(shell uname -s)

ifeq ($(SOURCE),)
	SOURCE=main.tex
endif

all: setup pdf

SKIP_CLEANUP?=0

pdf: ${PDF} move clean

move:
	mkdir ../target -p
	mv ${PDF} ../target/

setup: install setup_tex

clean_all: clean
	rm $(RM) count *.pdf

clean:
	test $(SKIP_CLEANUP) -ne 1 && $(RM) count \
		*.blg \
		*.ac* \
		*.al* \
		*.fdb_latexmk \
		*.dvi \
		*.fls \
		*.bbl \
		*.id* \
		*.lo* \
		*.fdb \
		*.gl* \
		*.nl* \
		*.ind \
		*.ilg \
		*.tex~ \
		*.ist \
		*.toc \
		*.run.xml \
		*.bcf \
		*.out \
		images/*converted-to.pdf \
		content/*.aux \
		includes/*.aux \
		*.aux || echo "Skip cleanup, pls do make clean manually."

install:
ifeq ($(UNAME_S),Linux)
	sudo apt-get install \
		biber
		latexmk \
		pandoc \
		texlive-bibtex-extra \
		texlive-extra-utils \
		texlive-font-utils \
		texlive-generic-extra \
		texlive-lang-german \
		texlive-latex-base \
		texlive-latex-extra \
		texlive-latex-recommended \
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
	pdflatex -halt-on-error -synctex=1 -interaction=nonstopmode --src-specials ${SOURCE}
	latexmk --silent -r .latexmk.rc -f -bibtex -pdf -bibtex-cond ${SOURCE}

.PHONY: src clean
