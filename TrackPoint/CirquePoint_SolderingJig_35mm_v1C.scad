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
     color("lime") down(1) cylinder(h=4, d=40); //disc object
    color("pink") forward(0) up(2) cuboid([55, 55, 2]); //bench mount

    }
     color("aqua") down(2) cylinder(h=3, d=35.75); //trackpoint disc
     color("orange") cylinder(h=10, d=25); //finger cutout
  }//difference

  color("blue") down(1) back(17.25) cuboid([8, 1, 4]); // trackpoint alignment 

}
