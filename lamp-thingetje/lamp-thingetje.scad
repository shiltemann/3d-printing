$fn = 30;

rotate([-90, 0, 0])
    linear_extrude(10)
    circle(d = 3);

translate([-3, 10, 0])
   rotate_extrude(angle=90)
   translate([3, 0, 0]) circle(d=3);
   
translate([-3, 13, 0])
    rotate([0, -90, 0])
    color("#f00")
    linear_extrude(120)
    circle(d = 3);
    
translate([-123, 8, 0])
    rotate([0, 0, -90])
    color("#f0f")
    rotate_extrude(angle=45)
    translate([-5,0, 0])
    circle(d = 3);
    
translate([-126.5, 11.55, 0])
    rotate([45, -90, 0])
    color("#00f")
    linear_extrude(12)
    circle(d = 3);
   
translate([-138.5, 6.6, 0])
    rotate([0, 0, -90 - 45])
   rotate_extrude(angle=90)
   translate([5, 0, 0]) circle(d=3);
   

translate([-142.05, 3.05, 0])
    rotate([-45, -90, 0])
    color("#00f")
    linear_extrude(6)
    circle(d = 3);