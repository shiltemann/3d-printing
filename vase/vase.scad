$fn = 40;
$fn2 = 140;
use <spiral.scad>

module cheapTorus(height=1, ir=1, thickness=1, bottom=false){
    union() {
        difference() {
            cylinder(h=height, r=ir + thickness);
            translate([0, 0, -1]) 
            cylinder(h=(height + 2), r=ir);
        } 
        if(bottom){
             cylinder(h=thickness, r=ir + thickness);
        }
    }

}



module holder2(thickness=1, height=20, start_radius=25, end_radius=15, pitch=500, starts=16, text="", text_scale=1){
    //translate([-2,0,0])
    union() {
        spiral_extrude(Radius=start_radius, EndRadius=end_radius, Pitch=pitch,Height=height - thickness, StepsPerRev=$fn2, Starts=starts){
            rotate([0,0,30]) square([thickness, 5 * thickness],center=false);
        }
        scale([-1, 1, 1])
        spiral_extrude(Radius=start_radius, EndRadius=end_radius, Pitch=pitch, 
                       Height=height - thickness, StepsPerRev=$fn,
                       Starts=starts){
            rotate([0,0,75]) square([thickness * 2, 5 * thickness],center=false);
        }
        
        translate([0,0,-0.5]) difference() {
            cheapTorus(ir=start_radius, thickness=thickness * 2, height=thickness * 3.5, bottom=true);
            
            translate([0, 0, 2.5 * thickness / 3]) scale(0.5 * text_scale) linear_extrude(0.5) text(text, font="EB Garamond", size=1, valign=40, halign="center");
        }
        translate([0, 0, height - 1]) cheapTorus(ir=end_radius, thickness=thickness * 3, height=2);
    }
}

holder2(start_radius=110/2, end_radius=45/2, thickness=1, height=140, text="Love from Saskia & Helena", text_scale=12);
