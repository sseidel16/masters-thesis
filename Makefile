DOT = $(wildcard graphviz/*.dot)
CPDF = $(DOT:.dot=.pdf)
DPDF = $(DOT:.dot=_dot.pdf)
PDF = $(CPDF) $(DPDF)

all: $(PDF)
	biber thesis
	pdflatex thesis

images: $(PDF)

%.pdf: %.dot
	circo -Tpdf $< -o $@

%_dot.pdf: %.dot
	dot -Tpdf $< -o $@

clean:
	rm -f $(PDF)

.PHONY: all images clean
