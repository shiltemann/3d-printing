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




bootyhole(height);

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
