SCADS := $(wildcard */*.scad)
PNGS := $(SCADS:.scad=.png)
STLS := $(SCADS:.scad=.stl)

all: $(PNGS) $(STLS)

pngs: $(PNGS)
.PHONY:pngs

stls: $(STLS)
.PHONY:stls

%.png: %.scad
	openscad $< --colorscheme Tomorrow -o $@

%.stl: %.scad
	openscad $< -o $@

stow:
	stow libs -t ~/.local/share/OpenSCAD/
.PHONY:stow
