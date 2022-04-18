include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

fileVersion = "1D";
  
$fn=120; //circle smoothness

main();
KB2040();

module main(){
  difference(){
    color("lime") cylinder(h=8.65, d=45); // main disc object
    color("green") up(2) cylinder(h=10, d=41); // inside cutout
    color("peru") translate([-(10/2), 15, 2.0+1.65]) cube([10,8,4.0+1]); // USB port
    color("orange") translate([-9, 15, 3.65]) cube([18, 5, 10]); // extra board cutout

  }
}  

module KB2040() {
    color("teal") translate([-(12/2), -14, 1]) cube([12,33,2]); //riser
    color("royalblue") translate([-10.5, -14, 1]) cube([1.5, 33, 4.5]); //side bumpers
    color("royalblue") translate([+9, -14, 1]) cube([1.5, 33, 4.5]); //side bumpers
    color("purple") translate([-10.5, -15, 1]) cube([21, 1.5, 4]); // end bumper
    
}

