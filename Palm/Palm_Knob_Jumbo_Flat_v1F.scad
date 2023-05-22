include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

//Palm_Knob
fileVersion = "1C";
  
$fn=120; //circle smoothness

diam=80;
shaftAdjust = 1;
flatAdjust = 10;
  
difference(){
  union() {
    difference(){
      color("steelblue") sphere(d=diam); //exterior
      down(2) color("lightblue") sphere(d=diam-5); //interior
      color("blue") down((diam/2)-flatAdjust) cuboid([diam,diam,diam]); //remove bottom
    }
    color("green") up(flatAdjust) cylinder(h=(diam/2)-shaftAdjust-flatAdjust, d=15); //center shaft
    color("teal") rotate([0,0,45]) up((4/2)+flatAdjust) cuboid([diam-7,4,4]); //shaft support 
    color("teal") rotate([0,0,130]) up((4/2)+flatAdjust) cuboid([diam-7,4,4]); //shaft support 
    }
 //joy post cutout     
 color("lime") zrot(45) up(2+flatAdjust) #cuboid([4,3,8], fillet=.5);
  
}//difference


