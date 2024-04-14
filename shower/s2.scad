linear_extrude(1)
text("S", font="Iosevka Slab");

linear_extrude(1)
translate([1, 0, 0])
 text("S", font="Iosevka Slab");
 
translate([-0.8,-0.5,0])
scale([1.2,1.2,1])
difference(){
    
    linear_extrude(1)
    translate([0.5, -0.5, 0])
     text("S", font="Iosevka Slab");
    
    translate([0, 2, -5])
    color("#f00")
    cube([10, 10, 10]);
    
}
    
rotate([0, 0, 180])
translate([-8.8,-10.5,0])
scale([1.2,1.2,1])
difference(){
    
    linear_extrude(1)
    translate([0.5, -0.5, 0])
     text("S", font="Iosevka Slab");
    
    translate([0, 2, -5])
    color("#f00")
    cube([10, 10, 10]);
    
}

translate([0,0,0])
scale([1,0.8,1])
linear_extrude(1)
translate([0.5, -0.5, 0])
 text("o", font="Iosevka Slab");


translate([-0.6,0,0])
scale([1,0.8,1])
linear_extrude(1)
translate([0.5, -0.5, 0])
 text("o", font="Iosevka Slab");

translate([0.7,1])
cube([2, 7.6, 1]);
