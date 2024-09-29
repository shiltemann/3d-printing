$fn = 20;

// Combination of the OP's pumpkin stem with the "faster" reply's pumpkin
// https://www.reddit.com/r/openscad/comments/pxl0a6/pumpkin/
// rib
rib_diameter = 12; 
ribs = 13;

// nut
height = 14;
// stem
torusRad=20;
torusstartAng=120; 
use <threadlib.scad>
flower();
bootyhole(height);

translate([0, 0, 10]) scale([1, 1, 0.2]) sphere(8.1);

module flower() {
    for (i=[0:ribs-1]) petal(i); 
}


module petal(i, length=4, width=5) { 
    color("White") 
    rotate([0, 0, i*(360/ribs)]) 
    translate([5, 0, height - 4]) 
        //rotate([0, rands(85,95,1)[0], 0])
        rotate([0, 90, 0])
        union() {
            scale([0.2, 1, 1]) cylinder(length * 4, 2, width);
            translate([0, 0, length * 4]) scale([0.2, 1, 1]) sphere(width + (0.1 / 8 * length));
        }
}
module bootyhole(height) {
    difference(){ 
        union(){
            // Nut
            color("red") nut("M5", turns=height);    
            // Add a tube around it to ensure sufficient support
            difference(){
                color("green") cylinder(h=height * 0.75, r=4);
                translate([0, 0, -0.5]) cylinder(h=(height + 1) * 0.75, r=2.6);
            }
        }
        // strip bottom and top
        translate([-5, -5, -1]) cube([10, 10, 1]);
        translate([-5, -5, height - 3.5]) cube([10, 10, 2]);
    }
}
