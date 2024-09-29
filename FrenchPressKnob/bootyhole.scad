use <threadlib.scad>

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

module bootyhole_void(height) {
    color("pink")
    cylinder(h=height * 0.75, r=4);
}
