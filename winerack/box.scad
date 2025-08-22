wine_rack_depth = 360;
wine_rack_width = 102;
wine_rack_height = 102;



module winerackit(places = 4, wall = 2) {
rendering_fix  = 1;
    difference(){
        cube([wine_rack_width, wine_rack_depth, wine_rack_height]);
        
        d = (wine_rack_depth - wall - wall - ((places - 1) * wall)) / places;
        
        union(){
            for(i = [1:places]) {
                translate([wall, (wall * i ) + (d * (i - 1)), wall])
                    color("red")
                    cube([102 - wall - wall, d, 
                          102 - wall + rendering_fix]);
            }
        }
            
        // cutout for human hands
        translate([0, rendering_fix, 0]) hull() {
        z = wine_rack_width / 1.5;
        translate([(wine_rack_width - z) / 2, -wall, wine_rack_height * 0.85])
        color("blue")
        cube([z, wall * 2, wine_rack_height / 4]);
        translate([(wine_rack_width - z) / 2 + wine_rack_height / 8,
            wall,
            wine_rack_height * 0.85
        ])
        color("blue")
        rotate([90, 0, 0])
        cylinder(h = wall * 2, d = wine_rack_height / 4);

        translate([wine_rack_width - ((wine_rack_width - z) / 2 + wine_rack_height / 8),
            wall,
            wine_rack_height * 0.85
        ])
        color("green")
        rotate([90, 0, 0])
        cylinder(h = wall * 2, d = wine_rack_height / 4);
        }


    }

}

module split_winerackit(places = 4, wall=2){
    
    d = (wine_rack_depth - wall - wall - ((places - 1) * wall)) / places;
    echo(d);
    
    places_a = floor(places / 2);
    places_b = places - places_a;
    
    echo(places_a, places_b);
    first_half_depth = (wall * (places_a + 1)) + (d * (places_a ));
    second_half_depth = (wall * (places_b + 1)) + (d * (places_b ));
    
    color("red") intersection() {
        cube(first_half_depth);
        winerackit(places=places, wall=wall);
    }
    
    translate([wine_rack_width * 1.5,10,0]) color("white") intersection() {
        translate([0, first_half_depth-  wall, 0]) cube(second_half_depth + wall);
        winerackit(places=places, wall=wall);
    }
}


split_winerackit(places=4, wall=1);


// boxes - inner thingies 
// 1 - 0
// 2 - 1
// 3 - 2
// subtract (n-1) * width of divider.