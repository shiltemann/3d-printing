difference(){
    
translate([0,-35, 0])
linear_extrude(height = 1.5)
    import(file = "kirby.svg", dpi = 253.96);
    
color("#f00")
translate([0,-35, 0.6])
linear_extrude(height = 1)
    import(file = "kirby-indentations.svg", dpi = 253.96);
}