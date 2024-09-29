$fn = 100;

// nut
height = 14;

use <bootyhole.scad>

union(){
    difference(){
        union(){
            design();
        }
        bootyhole_void(height);
    }
    bootyhole(height);
}


module design() {
    union(){
        color("white")
        translate([0, 0, 20])
        sphere(r=20);
        
        translate([17, 0, 10])
        sphere(3);
        
        translate([20, 0, 20])
        sphere(3);
        
        translate([17, 0, 30])
        sphere(3);
    }
    union(){
        color("white")
        translate([0, 0, 50])
        sphere(r=14);
        
        color("orange")
        translate([14, 0, 50])
        rotate([0, 90, 0])
        cylinder(10, 2, 0);
    }
    
    color("black")
    translate([0, 0, 62])
    union(){
        cylinder(2, 14, 14);
        cylinder(14, 9, 9);
    }
    
    
    
}