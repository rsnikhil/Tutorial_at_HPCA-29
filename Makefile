.PHONY: all
all:
	make -C Figs/
	asciidoctor README.adoc
