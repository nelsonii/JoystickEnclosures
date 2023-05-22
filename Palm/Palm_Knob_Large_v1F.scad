include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

//Palm_Knob
fileVersion = "1C";
  
$fn=120; //circle smoothness

diam=60;
shaftAdjust = 1;
  
difference(){
  union() {
    difference(){
      color("steelblue") sphere(d=diam); //exterior
      down(2) color("lightblue") sphere(d=diam-5); //interior
      color("blue") down(diam/2) cuboid([diam,diam,diam]); //remove bottom
    }
    color("green") cylinder(h=(diam/2)-shaftAdjust, d=15); //center shaft
    color("teal") rotate([0,0,45]) up(4/2) cuboid([diam-3,4,4]); //shaft support 
    color("teal") rotate([0,0,130]) up(4/2) cuboid([diam-3,4,4]); //shaft support 
    }
 //joy post cutout     
 color("lime") zrot(45) up(2) #cuboid([4,3,8], fillet=.5);
  
}//difference


