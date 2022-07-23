
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

thic = 0.65;
h = 8.4;

module  half(){
    box(thickness=thic, iw=2.3, id=13.3, ih=h);
    translate([thic, thic, thic]) 
        cube([1, 2, h]);
    translate([thic, 13.3 , thic]) 
        cube([1, 0.65, h]);
    
    // Hand rest holder
    translate([thic + 2.3, (13.3 - 7.9), h - 6.3]) 
        box(thickness=thic, iw=2.3, id=7.9, ih=6.3);
    // Cable holder
    translate([thic + 2.3, 0, h - 6.3]) 
        box(thickness=thic, iw=2.3, id=(13.3-7.9 - thic), ih=6.3);
}
half();
mirror([1,0,0]) half();