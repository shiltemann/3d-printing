// ice scoop holder
ed = 8;
ew = 14;
slop = 2;
d = 4;
h = 4;

difference(){
    cube([ew + slop + d, ed + slop + d, h], center=true);
    cube([ew + slop, ed + slop, h + 2], center=true);
}

color("#ff0000")
translate([-ew/2, (ed + slop + d)/ 2, -2])
cube([ew, 2, 30]);