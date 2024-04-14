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