
module box(thickness=1, iw=1, id=1, ih=1) {
    difference() {
        cube([
            iw + (2 * thickness),
            id + (2 * thickness),
            ih + thickness,
        ]);
        translate([thickness, thickness, thickness]) cube([
            iw,
            id,
            ih + 1.1 * thickness,
        ]);
    }
}

thic = 0.6;
h = 8.4;
kb_length = 13.6;
kb_width = 3.5;

i = 0.1;


module _half(){
    box(thickness=thic, iw=kb_width, id=kb_length, ih=h);
    translate([thic, thic, thic]) 
        cube([1, 2, h]);
    translate([thic, kb_length , thic]) 
        cube([1, 0.65, h]);
}


translate([0, -4, 0]) 
    cube([2 * (thic + kb_width + thic), 1 , 2]); 

_half();
mirror([-1,0,0])  translate([-thic, 0,0 ]) _half();