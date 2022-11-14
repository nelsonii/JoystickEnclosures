include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

//Slider_Disc
fileVersion = "1A";
  
$fn=120; //circle smoothness

union() {  
  difference(){
    union() {
     color("lime") down(4) cylinder(h=5.5, d=45); //disc object
    color("pink") forward(0) up(2) cuboid([55, 55, 2], fillet=1, edges=EDGES_BOTTOM); //bench mount

    }
     color("aqua") down(8) cylinder(h=10, d=41.5); //sensor cutout (full width, with overlay)
     color("orange") cylinder(h=10, d=30); //finger cutout
  }//difference

  color("blue") forward(1.125) left(21.75) down(4) cube([2.25, 2.25, 5.5]); // trackpoint alignment 

}
