$fn = 32;

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
use <bootyhole.scad>

difference(){
    scale([0.5, 0.5, 0.5]) union(){
        for (i=[0:ribs-1]) rib(i);
    }
    color("green") cylinder(h=height * 0.75, r=4);
}
translate([0, 0, 14]) scale([0.5, 0.5, 0.5])  stem();
bootyhole(height);

module rib(i) {
    color("DarkOrange")
    rotate([0, 0, i*(360/ribs)])
    translate([15, 0, 24])
        scale([1, 1, 0.9]) {
            rotate([90, 0, 0]) {
            rotate_extrude() {
                translate([20, 0, 0])
                scale([1, 1.5])
                circle(d=rib_diameter);
            }
        }
    }
}

module stem1() {
    color("Green")
    translate([0, 0, 15])
    cylinder(d=rib_diameter, h=11, $fn=$fn/2);
    color("Green")
    translate([0, -25, 0])
    rotate([-30, 0, 0])
    rotate([0, -90, 0])
    translate([30, 0, 0])
    rotate_extrude(angle=60) {
        translate([10, 0, 0])
        circle(d=rib_diameter, $fn=$fn/2);
    }
}

module stem() {
    HT=torusRad*sin(torusstartAng);
    posTop=HT-torusRad/4;
    translate([0,0,posTop]) union() {
    for(q=[0:20:359]) rotate([0,0,q])
    linear_extrude(height=torusRad,center=false,convexity=4,twist=rands(0,60,1)[0]-20,slices=20,scale=1.4) translate([0,0,0]) offset(r=1) circle(d=rands(2,torusRad/2,1)[0],$fn=3);
    }
}
