include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

fileVersion = "1D";
  
$fn=120; //circle smoothness

main();
  
module main(){
  difference(){
    color("lime") cylinder(h=8, d=44); 
    color("green") up(2) cylinder(h=10, d=40.5);
    color("pink") cylinder(h=10, d=15);
  }
}  
