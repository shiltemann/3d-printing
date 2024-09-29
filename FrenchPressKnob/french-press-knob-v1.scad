use <threadlib.scad>
$fn = 50;

height = 14;

difference(){ 
    union(){
        color("red") nut("M5", turns=height);    
        difference(){
            cylinder(h=height * 0.75, r=4);
            translate([0, 0, -0.5]) cylinder(h=(height + 1) * 0.75, r=2.6);
        }
    }
    // strip bottom
    translate([-5, -5, -1]) cube([10, 10, 1]);
}

translate([0, 0, (height * 0.75)]) cylinder(r=20, h=4, $fn=6);