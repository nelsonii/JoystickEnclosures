include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

//Slider_Disc
fileVersion = "1D";
  
$fn=120; //circle smoothness

union() {  
  difference(){
     color("lime") cylinder(h=6, d=40); //disc object
      color("pink") up(6.1) fillet_cylinder_mask(r=23, fillet=6); //disc round over
      color("aqua") cylinder(h=5, d=35.5); //trackpoint disc
      color("peru") up(4) cylinder(h=3, d=31); // trackpoint full cutout
      color("peru") translate([-(10/2), 15, 0]) cube([10,8,1]); //usb cutout and alignment
  }//difference

  color("blue") up(4) back(17.25) cuboid([8, 1, 2]); // trackpoint alignment 

}
