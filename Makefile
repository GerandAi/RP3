# Makefile for LaTeX pdf generation

# Set the name of the document (without .tex extension)
DOCNAME=report_aa12345

# Set latex to run with inputs from current directory (default)
#  Other include paths can go here (e.g. ./src)
#  NB: a blank path is required so default paths are searched.
LATEXENV=TEXINPUTS=':.'
# Set latex to quit when it encounters an error
LATEXFLAGS=-halt-on-error -interaction nonstopmode

# Set bibtex input paths
BIBENV=BIBINPUTS=.
BIBFLAGS=

# Setup bibtex and latex commands
LATEX:=$(LATEXENV) pdflatex $(LATEXFLAGS)
BIBTEX:=$(BIBENV) bibtex $(BIBFLAGS)

# Default target to generate the pdf
$(DOCNAME).pdf: $(DOCNAME).tex
	$(LATEX) $^
# If using bibtex, uncomment the lines below
#	$(BIBTEX) $(patsubst %.tex,%.aux,$^)
#	$(LATEX) $^
	$(LATEX) $^

# Target to clean all generated files and
clean:
	-rm $(DOCNAME).pdf $(DOCNAME).aux $(DOCNAME).log $(DOCNAME).bbl $(DOCNAME).blg
.PHONY: clean

# Target to cleanup extra files but not main output
cleanup:
	-rm $(DOCNAME).aux $(DOCNAME).log $(DOCNAME).bbl $(DOCNAME).blg
.PHONY: cleanup
