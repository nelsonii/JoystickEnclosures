include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

//Slider_Disc
fileVersion = "1D";
  
$fn=120; //circle smoothness

union() {  
  difference(){
     color("lime") cylinder(h=8, d=45); //disc object
      color("aqua") down(2) cylinder(h=7+1, d=41.5); //sensor cutout (full width)
      color("peru") up(5) cylinder(h=4, d=39); // touchable sensor surface
      color("peru") down(1) translate([-(10/2), 17.5, 0]) #cube([10,8,2+1]); //usb cutout
      color("red") down(1) cylinder(h=2+1, d=43); // snap lip
  }//difference

  color("blue") left(21.75) up(2)  cube([2.25, 2.25, 4]); // trackpoint alignment 

}
