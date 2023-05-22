include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=120; //circle smoothness
overlap = 1;

bracketXY=70.75;
bracketWidth = 30;
bracketThickness = 2;
slotWidth = 2.75;
centerHole = 18;

bracket();


module bracket() {
 
difference() {   
    bracketCore();
    bracketSlots();
}
}//bracket


module bracketCore() {
  union() {
    color("yellowgreen") cuboid([bracketWidth, bracketXY, bracketThickness], fillet=2, edges=EDGES_Z_ALL); // core shape
    color("yellowgreen") cyl(h=bracketThickness, d=bracketWidth+centerHole); // additional support
  }
}


module bracketSlots() {
  
    color("orange") cuboid([slotWidth, bracketXY-14, bracketThickness+overlap], fillet=1, edges=EDGES_Z_ALL);
    color("tomato") cyl(d=centerHole, h=bracketThickness+overlap);
    // this will create an oval: scale([1, 2, 1]) 
  
    //back((bracketXY/2)-3) color("tomato") cyl(d=slotWidth, h=bracketThickness+overlap);
    //forward((bracketXY/2)-3) color("tomato") cyl(d=slotWidth, h=bracketThickness+overlap);
  
}

module sliderIn() {

  difference() {
    union() {
      color("pink") cylinder (h=3.6, d=40); //inside retainer disc
      cylinder(h=3.6+enclosureTopThickness, d=14); // hub. the +2.5 is the thickness of the enclosure top
      //alignment pins & additional support
      left(5) color("sienna") cylinder(h=3.6+enclosureTopThickness+4, d=3); // alignment pin
      right(5) color("sienna") cylinder(h=3.6+enclosureTopThickness+4, d=3); // alignment pin
    }
    
    //Socket for Ball/tip of joystick
    //zrot(0) up(3) cuboid([4.1,3.1,10], fillet=.5); //shaft cutout
    cylinder(h=4, d=3.3);
    down(.5) sphere(d=4.3); // socket
    
    //mount/assembly screws
    forward(5) cylinder(h=10, d=2.5); // mount screw hole
    back(5) cylinder(h=10, d=2.5); // mount screw hole

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
