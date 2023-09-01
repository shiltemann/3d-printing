SCADS := $(wildcard */*.scad)
PNGS := $(SCADS:.scad=.png)

all: $(PNGS)

%.png: %.scad
	openscad $< --colorscheme Tomorrow -o $@

stow:
	stow libs -t ~/.local/share/OpenSCAD/
.PHONY:stow
