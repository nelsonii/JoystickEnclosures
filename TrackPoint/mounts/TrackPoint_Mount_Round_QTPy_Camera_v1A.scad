include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=60; //circle smoothness

main();
  
module main(){
  difference(){
    color("lime") cylinder(h=11, d=44); // outer shell
    color("green") up(6) cylinder(h=99, d=40.5, $fn=120); //cutout for trackpoint
    color("pink") cylinder(h=99, d=8); //hole for t-nut
    color("blue") up(4) cylinder(h=99, d=20); // countersink for t-nut
    color("orange") forward(8) cylinder(h=99, d=3); // t-nut tab
    color("orange") back(8) cylinder(h=99, d=3); // t-nut tab
    color("orange") left(8) cylinder(h=99, d=3); // t-nut tab
    color("orange") right(8) cylinder(h=99, d=3); // t-nut tab
  }
}  
