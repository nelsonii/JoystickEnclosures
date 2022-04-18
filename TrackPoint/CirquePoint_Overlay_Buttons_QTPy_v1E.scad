include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

fileVersion = "1E";
  
$fn=120; //circle smoothness

difference() {
union() {  
  difference(){
     color("lime") cylinder(h=3, d=43); //disc object
      color("pink") up(4) fillet_cylinder_mask(r=23, fillet=6); //disc round over
      color("aqua") cylinder(h=2.5, d=40.20); //trackpoint disc
  }//difference
    color("peru") up(1.5) cylinder(h=1, d=31); // trackpoint stiffener
    color("blue") up(1.5)  back(20.5) cuboid([8, 2.3, 3]); // trackpoint alignment 
      
}//union
      color("maroon") down(1) back(9.5) cylinder(h=5, d=11);
      color("maroon") down(1) forward(9.5) cylinder(h=5, d=11); 
      color("maroon") down(1) left(9.5) cylinder(h=5, d=11); 
      color("maroon") down(1) right(9.5) cylinder(h=5, d=11); 
}//difference