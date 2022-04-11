include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

fileVersion = "1D";
  
$fn=60; //circle smoothness

main();
  
module main(){
  difference(){
    union(){
     color("lime") cylinder(h=8, d=44); //outer shell
     color("lime") back(20) up(4) cuboid([10, 30, 8]);
    }
    color("green") up(2) cylinder(h=10, d=40.5, $fn=120); //cutout for trackpoint
    color("pink") cylinder(h=10, d=15); // finger hole for release
  }
}  
