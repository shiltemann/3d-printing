$fn=100;  // fineness

wall=0.5; // wall thickness
bw=10.3; // back width
bh=7.6;  // back height
bd=5;    // back depth

bowlr=4.5;

//back side
difference(){
    cube([bw,bd,bh],true);

    // remove top inside layer
    translate([0,1,3.5])
        cube([bw-2*wall,6-wall,2.8], true);

   // create slope for food
   translate([0,1.95,2])
   rotate([-30,0,0])
   color([0,0,1]) 
    cube([10.3-2*wall,7-wall,3.5],true);

   // lower back edge
   color([1,0,0])
   translate([0,-wall*1.3,4])
   rotate([10,0,0])
   cube([bw+1,bd-1,1], true);

}

//bowls
bowlh=5.3;
bowlf=1;  //height of bowl front
module bowl(radius){
    
  union(){  
  difference(){
    //create hollow cylinder
    cylinder(bowlh,bowlr,bowlr);
    translate([0,0,wall])
    cylinder(1.1*bowlh,bowlr-wall,bowlr-wall);  
     
    //slice off   
    rotate([-10,25,0])
    translate([0,0,3])
    cylinder(12,bowlr*1.5, bowlr*1.5);
  }    
  
  difference(){
  cylinder(bowlf,bowlr,bowlr);
      
  translate([0,0,wall])    
  cylinder(bowlf,bowlr-wall,bowlr-wall);    
  }
  }
}


module slide(h,w,d,slope){
  difference(){
  union(){
  difference(){
  union(){
  difference(){
      
   union(){    
    cube([h,w,d]);
      
    //color([1,1,0])
    //translate([2.5,-4,0])
    //rotate([0,0,-113])
    //bowl(bowlr);    
   }
 
   //remove slope    
   rotate([slope,0,0]) 
   translate([wall,0,1])   
   cube([h-2*wall,w-2*wall,d-2*wall]);
      
    
   //cut off top
   color([0,1,1])
   translate([-0.1,0,3.8])    
   cube([h*1.5,w*1.5,d*1.1]);
  }
  
  //add walls
  union(){
  cube([wall,8.1,5.3]);
 
  translate([4.5,1,1])
  rotate([20,0,0])
  cube([wall,6.9,3.7]);
  }
  }
  //shorten
  translate([-0.5,-0.2,-1])
  cube([6,2,8]);
  }
   color([1,1,0])
   translate([2.5,-2.0,0])
   rotate([0,0,-113])
   bowl(bowlr);  
  }
   //remove slope    
   rotate([slope,0,0]) 
   translate([wall,0,1])   
   cube([h-2*wall,w-2*wall,d-2*wall]);
  }
}

//slides
translate([-2.5,10,-3.8])
rotate([0,0,200])
slide(5,9,5,20);

mirror([1,0,0])
translate([-2.5,10,-3.8])
rotate([0,0,200])
slide(5,9,5,20);











