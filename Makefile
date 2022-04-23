SCADS := $(wildcard */*.scad)
PNGS := $(SCADS:.scad=.png)

all: $(PNGS)

%.png: %.scad
	openscad $< -o $@
