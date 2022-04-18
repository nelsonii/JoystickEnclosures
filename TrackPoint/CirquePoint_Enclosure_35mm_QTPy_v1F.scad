include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

fileVersion = "1D";
  
$fn=120; //circle smoothness

main();
qtpy();
snapring();
  
module main(){
  difference(){
    color("lime") cylinder(h=8.65, d=40); //disc object
    color("green") up(2) cylinder(h=10, d=35);
   //QT PY USB -- 1.65 is thickness of the qtpy pcb
    color("peru") translate([-(10/2), 15, 2.5+1.65]) cube([10,8,3.50+1]); 

  }
}  

module qtpy() {
     //riser for QT PY
    color("teal") translate([-(12/2), -5, 1]) cube([12,23,2]);
    //bumper for QT PY
    color("CadetBlue") translate([-(18/2), -6.5, 1]) cube([18, 1.5, 4.5]); 
    //side bumpers for QT PY
    color("royalblue") translate([-10.5, -6.5, 1]) cube([1.5, 22, 4.5]);
    color("royalblue") translate([+9, -6.5, 1]) cube([1.5, 22, 4.5]);
}

module snapring() {
  //color("purple") tube(
}