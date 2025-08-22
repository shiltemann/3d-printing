// a = 23; // degrees
// bottom = 14cm
// height = 3cm
$fn = 8;
// 

difference(){
    color("red") cylinder(h=30, r1 = 140, r2 = 10);
    translate([0, 0, -5]) color("blue") cylinder(h=30, r1 = 140, r2 = 10);
    cube([45, 5, 100], center=true);
        
    union(){
        for(i = [1 : 36]) {
            rotate([0, 0, i * 10]) translate([120, 0, -10]) rotate([0, 0, 90]) cube([12, 4, 100]);
        }
    }
}
