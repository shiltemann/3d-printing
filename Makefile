SCADS := $(wildcard */*.scad)
PNGS := $(SCADS:.scad=.png)

all: $(PNGS)

%.png: %.scad
	openscad $< -o $@

stow:
	stow libs -t ~/.local/share/OpenSCAD/
.PHONY:stow
