buttom_symbol = ";";

// NOT MINE
// https://www.thingiverse.com/thing:1241377
// LICENSE: CC-BY-NC-SA

characters = "②阴在阳之内，不在阳之对：阴阳是我国古代传统哲学和文化思想的基点，其思想笼罩着大千宇宙、细末尘埃，并影响到意识形态的一切领域。阴阳学说是把宇宙万物作为对立的统一体来看待，表现出朴素的辩证思想。阴、阳二字早在甲骨文、金文中出现过，但作为阴气、阳气的阴阳学说，最早是由道家始祖楚国人老子所倡导，并非《易经》提出。此计中所讲的阴指机密、隐蔽；阳，指公开、暴露。阴在阳之内，不在阳之对，在兵法上是说秘计往往隐藏于公开的事物里，而不在公开事物的对立面上";

thickness = 2;

inner_wall = "YES";
hxfont = "Source Han Serif SC";

function PI() = 3.14159;

// Given a `radius` and `angle`, draw an arc from zero degree to `angle` degree. The `angle` ranges from 0 to 90.
// Parameters: 
//     radius - the radius of arc
//     angle - the angle of arc
//     width - the width of arc
module a_quarter_arc(radius, angle, width = 1) {
    outer = radius + width;
    intersection() {
        difference() {
            offset(r = width) circle(radius, $fn=48); 
            circle(radius, $fn=48);
        }
        polygon([[0, 0], [outer, 0], [outer, outer * sin(angle)], [outer * cos(angle), outer * sin(angle)]]);
    }
}

// Given a `radius` and `angle`, draw an arc from zero degree to `angle` degree. The `angle` ranges from 0 to 360.
// Parameters: 
//     radius - the radius of arc
//     angle - the angle of arc
//     width - the width of arc
module arc(radius, angles, width = 1) {
    angle_from = angles[0];
    angle_to = angles[1];
    angle_difference = angle_to - angle_from;
    outer = radius + width;
    rotate(angle_from)
        if(angle_difference <= 90) {
            a_quarter_arc(radius, angle_difference, width);
        } else if(angle_difference > 90 && angle_difference <= 180) {
            arc(radius, [0, 90], width);
            rotate(90) a_quarter_arc(radius, angle_difference - 90, width);
        } else if(angle_difference > 180 && angle_difference <= 270) {
            arc(radius, [0, 180], width);
            rotate(180) a_quarter_arc(radius, angle_difference - 180, width);
        } else if(angle_difference > 270 && angle_difference <= 360) {
            arc(radius, [0, 270], width);
            rotate(270) a_quarter_arc(radius, angle_difference - 270, width);
       }
}

// Create a 3D character around a cylinder. The `radius` and `arc_angle` determine the font size of the character. 
// Parameters: 
//     character - 3D character you want to create
//     arc_angle - angle which the character go across
//     radius - the cylinder radius
//     font - the character font
//     thickness - the character thickness
//     font_factor - use this parameter to scale the calculated font if necessary
module cylinder_character(character, arc_angle, radius, font = hxfont, thickness = 1, font_factor = 1) {
    half_arc_angle = arc_angle / 2;
    font_size = 2 * radius * sin(half_arc_angle) * font_factor;

    rotate([0, 0, -half_arc_angle]) intersection() {
       translate([0, 0, -font_size / 5]) 
             linear_extrude(font_size * 1.5) 
                 arc(radius, [0, arc_angle], thickness);
    
       rotate([90, 0, 90 + half_arc_angle]) 
            linear_extrude(radius + thickness) 
                text(character, font = font, size = font_size, halign = "center");
    }
} 


// It has the same visual effect as `cylinder_character`, but each character is created by the `text` module. Use this module if your `arc_angle` is small enough and you want to render a model quickly. 
// Parameters: 
//     character - 3D character you want to create
//     arc_angle - angle which the character go across
//     radius - the cylinder radius
//     font - the character font
//     thickness - the character thickness
//     font_factor - use this parameter to scale the calculated font if necessary
module fake_cylinder_character(character, arc_angle, radius, font = hxfont, thickness = 1, font_factor = 1) {
    half_arc_angle = arc_angle / 2;
    font_size = 2 * radius * sin(half_arc_angle) * font_factor;

    translate([radius, 0, 0]) rotate([90, 0, 90]) 
        linear_extrude(thickness) 
            text(character, font = font, size = font_size, halign = "center");
} 

// Create a chain text around a cylinder.
// Parameters: 
//     text - the text you want to create
//     radius - the cylinder radius
//     thickness - the character thickness
module chain_text(text, radius, thickness = 1) {
    arc_angle = 360 / len(text);

    for(i = [0 : len(text) - 1]) {
        rotate([0, 0, i * arc_angle]) 
            cylinder_character(text[i], arc_angle, radius, thickness = thickness);
    }
}

// Create a chain text around a cylinder for Chinese characters. It uses the font "微軟正黑體".
// Parameters: 
//     text - the text you want to create
//     radius - the cylinder radius
//     thickness - the character thickness
module chain_text_chinese(text, radius, thickness = 1) {
    arc_angle = 360 / len(text);

    for(i = [0 : len(text) - 1]) {
        rotate([0, 0, i * arc_angle]) 
            cylinder_character(text[i], arc_angle, radius, font, thickness, 0.85);
    }
}

// Create a character tower. If you want to print it easily, set the `inner_wall` parameter to `"YES"`. It will add an inner wall with the thickness of the half `thickness` value.
// Parameters: 
//     symbol - the bottom symbol
//     fchain - the characters around the tower
//     thickness - the character thickness
//     inner_wall - `"YES"` will add an inner wall with the thickness of the half `thickness` value.
module tower_of_characters(symbol, characters, thickness = 1, inner_wall = "NO", underline = "NO") {
    radius = 40;
    
    characters_of_a_circle = 40;
    arc_angle = 360 / characters_of_a_circle;
    
    half_arc_angle = arc_angle / 2;
    font_size = 2 * radius * sin(half_arc_angle);
    z_desc = font_size / characters_of_a_circle;
	
	len_of_characters = len(characters);

    // characters
	
	for(i = [0 : len_of_characters - 1]) {
		translate([0, 0, -z_desc * i])
			rotate([0, 0, i * arc_angle]) 
				fake_cylinder_character(characters[i], arc_angle, radius, thickness = thickness, font_factor = 1.05);
				
        if(underline == "YES"){
            translate([0, 0, font_size - 1 -z_desc * i])
                rotate([-1.5, 0, i * arc_angle - half_arc_angle])
                    linear_extrude(1.2) 
                        arc(radius, [0, arc_angle], thickness);
        }
		if(inner_wall == "YES") {                    
			translate([0, 0, 0.2 - z_desc * i])
				rotate([-1.5, 0, i * arc_angle - half_arc_angle])
					linear_extrude(font_size) 
						arc(radius, [0, arc_angle], thickness / 2);
		}
	} 
    
    // bottom
    
    difference() {
        translate([0, 0, -z_desc * len_of_characters]) 
            linear_extrude(font_size) 
                circle(radius + thickness * 1.5, $fn=48);
            
        translate([0, 0, -z_desc * len_of_characters + font_size * 3 / 4]) 
            linear_extrude(font_size) 
			    text(symbol, font = hxfont, size = font_size * 5, halign = "center", valign = "center");
    }
}

// Create a character tower for chinese. It uses the font "微軟正黑體". If you want to print it easily, set the `inner_wall` parameter to `"YES"`. It will add an inner wall with the thickness of the half `thickness` value.
// Parameters: 
//     symbol - the bottom symbol
//     characters - the characters around the tower
//     thickness - the character thickness
//     inner_wall - `"YES"` will add an inner wall with the thickness of the half `thickness` value.
// Create a character tower for chinese. It uses the font "微軟正黑體". If you want to print it easily, set the `inner_wall` parameter to `"YES"`. It will add an inner wall with the thickness of the half `thickness` value.
// Parameters: 
//     symbol - the bottom symbol
//     characters - the characters around the tower
//     thickness - the character thickness
//     inner_wall - `"YES"` will add an inner wall with the thickness of the half `thickness` value.
module tower_of_chinese_characters(symbol, characters, thickness = 1, inner_wall = "NO") {
    radius = 40;
    
    characters_of_a_circle = 30;
	arc_angle = 360 / characters_of_a_circle;
    
    half_arc_angle = arc_angle / 2;
    font_size = 2 * radius * sin(half_arc_angle);
    z_desc = font_size / characters_of_a_circle;


    // characters
    
    for(i = [0 : len(characters) - 1]) {
        translate([0, 0, -z_desc * i])
            rotate([0, 0, i * arc_angle]) 
                fake_cylinder_character(characters[i], arc_angle, radius, font = font, thickness = thickness, font_factor = 0.75);
                
        translate([0, 0, font_size - 1 -z_desc * i])
            rotate([-2, 0, i * arc_angle - half_arc_angle])
                linear_extrude(1.2) 
                    arc(radius, [0, arc_angle], thickness);

        if(inner_wall == "YES") {                    
            translate([0, 0, 0.2 - z_desc * i])
                rotate([-2, 0, i * arc_angle - half_arc_angle])
                    linear_extrude(font_size) 
                        arc(radius, [0, arc_angle], thickness / 2);
        }
    } 
    
    // bottom
  
    difference() {
        translate([0, 0, -z_desc * len(characters)]) 
            linear_extrude(font_size) 
                circle(radius + thickness * 1.5, $fn=48);
            
        translate([0, 0, -z_desc * len(characters) + font_size * 3 / 4]) 
            linear_extrude(font_size) 
			    text(symbol, font = font, size = font_size * 5, halign = "center", valign = "center");
    }
}


tower_of_characters(buttom_symbol, characters, thickness, inner_wall = "YES", underline="NO");
