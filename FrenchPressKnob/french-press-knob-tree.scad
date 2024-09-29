$fn = 20;

// nut
height = 14;

use <bootyhole.scad>

difference(){
    design();
    bootyhole_void(height);
}
bootyhole(height);


module design() {
    sphere(r=10);
}