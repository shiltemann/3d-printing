th = 7;
d = 1;

w = 100;
h = 50;

cube([th, h, d]);

//right
translate([w - th, 0, 0])
  cube([th, h, d]);

//top
cube([w, th, d]);
//bottom
translate([0, h - th, 0])
  cube([w, th, d]);

color("#ff0")
linear_extrude(d)
polygon(points=[
    [w / 2 - th, th],
    [w / 2 + th, th],
    [w / 4 * 3, th * 4],
    [w / 4, th * 4]
]);

/*
color("#f0f")
translate([w / 4, th * 2, 0])
cube([w / 2, th * 2, d]);
*/