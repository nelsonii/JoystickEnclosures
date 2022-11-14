include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

fileVersion = "1D";
  
$fn=120; //circle smoothness

main();
qtpy();

  
module main(){
  difference(){
    color("lime") cylinder(h=8.65, d=45); //disc object
     color("green") up(2) cylinder(h=10, d=41.5); // sensor cutout (full width, with overlay)
     color("peru") translate([-(10/2), 17.5, 2.5+1.65]) cube([10,8,3.50+1]); //usb cutout
     color("orange") translate([-9, 15, 3.0]) cube([18, 5, 10]); // extra board cutout
     color("orange") translate([-9, 18, 6.65]) cube([18, 5, 5]); // extra board cutout (clear out stragglers)
     color("red") up(6.65) tube(od=50, id=43, h=5); // snap lip
  }
}  

module qtpy() {
     //riser for QT PY
    color("teal") translate([-(12/2), -2.5, 1]) cube([12,23,2]);
    //bumper for QT PY
    color("CadetBlue") translate([-(18/2), -2.5, 1]) cube([18, 1.5, 4.5]); 
    //side bumpers for QT PY
    color("royalblue") translate([-10.5, -2.5, 1]) cube([1.5, 21.5, 4.5]);
    color("royalblue") translate([+9, -2.5, 1]) cube([1.5, 21.5, 4.5]);
}

