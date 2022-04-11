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
     color("lime") cylinder(h=2, d=60); // mounting shell
    }
    color("green") up(2) cylinder(h=10, d=40.5, $fn=120); //cutout for trackpoint
    color("pink") cylinder(h=10, d=15); // finger hole for release
        color("orange") forward(26) cylinder(h=99, d=3); // screw hole
    color("orange") back(26) cylinder(h=99, d=3); // screw hole
    color("orange") left(26) cylinder(h=99, d=3); // screw hole
    color("orange") right(26) cylinder(h=99, d=3); // screw hole
  }
}  
