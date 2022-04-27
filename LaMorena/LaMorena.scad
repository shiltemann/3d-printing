$fn = 200;

use <spiral.scad>


module holder(thickness=1, height=20, ir=10){
    difference() {
        cylinder(h=height, r=ir + thickness);
        translate([0, 0, thickness]) 
        cylinder(h=(height + 4), r=ir);
    } 
    
}

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



module holder2(thickness=1, height=20, ir=25, pitch=46, starts=12, text=""){
    rir = ir * 1.002;
    //translate([-2,0,0])
    union() {
        spiral_extrude(Radius=rir, EndRadius=rir, Pitch=pitch, 
                       Height=height - thickness, StepsPerRev=$fn,
                       Starts=starts){
            rotate([0,0,10])square([thickness * 0.98, 1.5 * thickness],center=false);
        }
        scale([-1, 1, 1])
        spiral_extrude(Radius=rir, EndRadius=rir, Pitch=pitch, 
                       Height=height - thickness, StepsPerRev=$fn,
                       Starts=starts){
            rotate([0,0,10])square([thickness * 0.98, 1.5 * thickness],center=false);
        }
        
        difference() {
            cheapTorus(ir=ir, thickness=thickness, height=thickness * 1.5, bottom=true);
            translate([0, 0, 2.5 * thickness / 3]) scale(0.5) linear_extrude(0.5) text(text, font="Ubuntu Monot", size=1, valign=40, halign="center");

        }
        // translate([0, 0, height - thickness]) cheapTorus(height=thickness,ir=ir, thickness=thickness);
    }
}

module fun_handle(dia=1, height=10){
   union() {
        rotate([0, 0, 0]) cube([dia, dia, height], center=true);
        //rotate([0, 0, 45]) cube([dia, dia, height], center=true); 
    } 
}



// Inner Diameters
lamorena_ir = 3.33;
beans_ir=3.75;
sour_ir = 3.12;

// Thickness
thicc = 0.5;

// Outer Diameters
lamor_od = lamorena_ir + lamorena_ir + thicc + thicc;
beans_od = beans_ir + beans_ir + thicc + thicc;

lamor_off = lamor_od / 2 - thicc / 4;
height = 6 + thicc;


translate([0, -lamor_off, 0]) holder2(ir=lamorena_ir, thickness=thicc, height=height, text="Helena");
translate([0, lamor_off, 0]) holder2(ir=lamorena_ir, thickness=thicc, height=height, text="Saskia");

translate([lamor_off * 2, -lamor_off, 0]) holder2(ir=lamorena_ir, thickness=thicc, height=height, text="La Morena");
translate([lamor_off * 2, lamor_off, 0]) holder2(ir=lamorena_ir, thickness=thicc, height=height, text="Galaxians");

// Beans
// translate([-lamor_off * 1.9, 0, 0]) holder(ir=beans_ir, thickness=thicc, height=height);

// Sour Cream
// translate([lamor_off * 3.7, 0, 0]) holder(ir=sour_ir, thickness=thicc, height=height);

handle_height = height * 1.5;


// Handle
difference() {
    translate([lamor_off, 0, height / 2]) rotate([0, 0, 45]) fun_handle(height=height, dia=5);

translate([0, -lamor_off, 0]) cylinder(h=height * 1.05, r=lamorena_ir);
translate([0, lamor_off, 0]) cylinder(h=height * 1.05, r=lamorena_ir);
translate([lamor_off * 2, -lamor_off, 0]) cylinder(h=height * 1.05, r=lamorena_ir);
translate([lamor_off * 2, lamor_off, 0]) cylinder(h=height * 1.05, r=lamorena_ir);
}


// Side Bits
translate([lamor_off + 1.7, 0, 1.4 * height]) rotate([0, 30, 0]) fun_handle(height=height);
translate([lamor_off - 1.7, 0, 1.4 * height]) rotate([0, -30, 0]) fun_handle(height=height);

// Support
translate([lamor_off - 2.4, 0, 1.15 * height]) rotate([0, 30, 0]) fun_handle(height=4, dia=0.6);
translate([lamor_off + 2.4, 0, 1.15 * height]) rotate([0, -30, 0]) fun_handle(height=4, dia=0.6);

translate([lamor_off, 1, 1.05 * height]) rotate([0, -30, 90]) fun_handle(height=4);

translate([lamor_off, -1, 1.05 * height]) rotate([0, -30, -90]) fun_handle(height=4);

// Top Bar
translate([lamor_off, 0, 1.798 * height]) rotate([0, 90, 0]) fun_handle(height=height * 0.875);


translate([lamor_off, 0, 1.3 * height]) rotate([0, 90, 0]) fun_handle(height=3);


// Bottom
//translate([lamor_off, 0, thicc / 2]) cube([6, 6, thicc], center=true);





