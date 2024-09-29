$fn = 20;

// Combination of the OP's pumpkin stem with the "faster" reply's pumpkin
// https://www.reddit.com/r/openscad/comments/pxl0a6/pumpkin/
// rib
rib_diameter = 12; 
ribs = 13;

// nut
height = 14;
// stem
torusRad=20;
torusstartAng=120; 
use <bootyhole.scad>

bootyhole(height);
