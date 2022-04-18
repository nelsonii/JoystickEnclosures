include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

fileVersion = "1A";
  
$fn=120; //circle smoothness

union() {  
  difference(){
     color("lime") cylinder(h=6, d=45); //disc object
      color("pink") up(7) fillet_cylinder_mask(r=24, fillet=6); //disc round over
      color("aqua") cylinder(h=5, d=40.75); //trackpoint disc
      color("peru") up(4) cylinder(h=3, d=36); // trackpoint full cutout
      color("maroon") down(1) cylinder(h=5, d=40);
      color("peru") translate([-(10/2), 15, 0]) cube([10,8,1]); //usb cutout and alignment
  }//difference

  color("blue") up(4) back(19.75) cuboid([8, 1, 2]); // trackpoint alignment 


}
