rotate([0, 180, 180]) difference(){
    
translate([0,-35, 0])
linear_extrude(height = 1.5)
    import(file = "kirby.svg", dpi = 253.96);
    
color("#f00")
translate([0,-35, 0.6])
linear_extrude(height = 1)
    import(file = "kirby-indentations.svg", dpi = 253.96);
}

use <LEGO.scad>;

module dots(){ 
difference(){
 block(
            width=1,
            length=2,
            height=1/3
        );

 block(
            width=1,
            length=2,
            height=1/3,
            type="tile"
        );
}
}

color("#f00") 
  translate([6.5, -3.5 , -3.5])
  rotate(-16)
  dots();

color("#f00") 
  translate([138.8 - 6.5, -3.5 , -3.5])

  rotate(16)
  dots();