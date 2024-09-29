$fn = 60;

// nut
height = 14;

use <bootyhole.scad>

difference(){
    union(){
        translate([0, 0, height - 3.5])
        design();
    }
    bootyhole_void(height);
}
bootyhole(height);


module design() {
    
    for(g=[0:1:6]){
        translate([0, 0, 10 * g]) 
            cylinder(10, 20 - (g * (15 / 6)), 16 - (g * (16 / 6)));
    }
//    translate([0, 0, 10]) cylinder(10, 18, 14);
    
    for(q=[0:83:3600]){
    color("red")
        rotate([0, 0, q])
        translate([18 - (q / 280), 0, 3 + q / 66])
        sphere(3 - (q / 3600));
    }
}