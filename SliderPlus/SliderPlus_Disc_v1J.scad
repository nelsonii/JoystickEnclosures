include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=120; //circle smoothness

enclosureTopThickness = 2.5;

//MAIN
//left(30) sliderIn();
right(30) sliderOut();


module sliderIn() {

  difference() {
    union() {
      color("pink") cylinder (h=3.6, d=50); //inside retainer disc
      cylinder(h=3.6+enclosureTopThickness, d=14); // hub. the +2.5 is the thickness of the enclosure top
      //alignment pins & additional support
      left(5) color("sienna") cylinder(h=3.6+enclosureTopThickness+4, d=3); // alignment pin
      right(5) color("sienna") cylinder(h=3.6+enclosureTopThickness+4, d=3); // alignment pin
    }
    
    //Socket for Ball/tip of joystick
    //zrot(0)  cuboid([4.5,3.5,10], fillet=.5); //shaft cutout
    //down(4) sphere(5);
    cylinder(h=4, d=3.3);
    down(.5) sphere(d=4.3); // socket
    
    //mount/assembly screws
    up(2) forward(5) cylinder(h=10, d=2.5); // mount screw hole
    up(2) back(5) cylinder(h=10, d=2.5); // mount screw hole
    
    //anti spin screws
    left(20) cylinder(h=10, d=2.5);
    right(20) cylinder(h=10, d=2.5);

  }  
  
  
  
}//sliderIn


module sliderOut() {  
  difference(){
    
    foamCutout = 51; // 2"
    discDiameter = foamCutout+12;
    
    color("lime") cylinder(h=5, d=discDiameter); //disc
    
      color("pink") up(6) fillet_cylinder_mask(r=discDiameter/2, fillet=9); //disc round over
      color("aqua") up(4) cylinder(h=2, d=foamCutout); //foam cutout

      forward(5) color("orange") cylinder(d=2.5, h=10); // mounting screw
      forward(5) up(4-2.6) color("tomato") cylinder(h=2.6, d=4.6); // countersink
      back(5) color("orange") cylinder(d=2.5, h=10); // mounting screw
      back(5) up(4-2.6) color("tomato") cylinder(h=2.6, d=4.6); // countersink

      //alignment holes (pins fit in)
      left(5) color("khaki") cylinder(h=10, d=3.1);
      right(5) color("khaki") cylinder(h=10, d=3.1);


  }//difference
}//sliderOut
