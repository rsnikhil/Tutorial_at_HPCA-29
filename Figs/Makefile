SVGFILES = README_fig1.svg \

PNGFILES = $(foreach svgfile,$(SVGFILES),$(patsubst %.svg,%.png,$(svgfile)))

test: $(PNGFILES)

%.png: %.svg
	inkscape --export-filename=$@  --export-area-drawing  -d 300 -y 0.0 $<
