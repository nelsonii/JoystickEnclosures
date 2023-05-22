include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

  
$fn=120; //circle smoothness

height = 12;
sensorCutout = 35.25;
snapLipOverlap = 6.5;
controller = false; // true=this is a controller board (for mini) -- false=regular setup 


difference() {
  union() {
    main();
    //forward(4) qtpy();
    forward(10) BoB();
  }
 color("red") up(height-snapLipOverlap-1) tube(od=sensorCutout+5, id=sensorCutout+1, h=10); // snap lip
 
 if (controller) {
  color("salmon") forward(22) left(7/2) up(2) cube([7,10, 1]); //slot for ribbon cable
 }
 
   // MKIII GlidePoint alignment (sides)
  if (!controller) {
    tabHeight = height-snapLipOverlap;
    color("blue")   up(height) left(17.5) cuboid([1.25, 7, 3.5]); 
    color("blue")  up(height) right(17.5) cuboid([1.25, 7, 3.5]); 
  }
 
 
  
}
  
module main(){
  difference(){
    color("lime") cylinder(h=height, d=sensorCutout+3.25); //disc object
     color("yellow") up(2) cylinder(h=height, d=sensorCutout-1.5); // sensor cutout -- since bottom, we can bulk up slightly
     color("peru") translate([-(13/2),(sensorCutout/2)-5, 5.5]) cube([13,10,6.5+2]); //usb cutout
  }
}  

module BoB() {
  color("yellowgreen") left(12.2) cube([3, 24, 3.5]); // PCB Rail
  color("yellowgreen") right(12.2-3) cube([3, 24, 3.5]); // PCB Rail
  color("sienna") left(12.2) forward(0) cube([6, 2, 6]); // end stop
  color("sienna") right(6.2) forward(0) cube([6, 2, 6]); // end stop
  color("maroon") left(14.2) forward(0) cube([2, 22, 6]); // side stop
  color("maroon") right(12.2) forward(0) cube([2, 22, 6]); // side stop
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

module mousecable() {
  // slots -- for easier install
  left(12) up(9) back(15) #cuboid([3,10, 10]);
  right(12) up(9) back(15) #cuboid([3,10, 10]);
  // holes -- a pain to install
  //left(13) up(4) back(22) xrot(90) #cylinder(h=10, d=3);
  //right(13) up(4) back(22) xrot(90) #cylinder(h=10, d=3);
}