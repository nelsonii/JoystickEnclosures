include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
$fn=60; //circle smoothness

caseWidthX = 88.9; // 3.5"
caseDepthY = 88.9; // 3.5"
bottomThickness = 3;

difference(){

      //base/bottom
      union() {
        //base
        up(bottomThickness/2) color("yellow") cuboid([caseWidthX, caseDepthY, bottomThickness], fillet=2, edges=EDGES_Z_ALL);
        //standoffs
        back(38) left(38) color("gold") cylinder(d=8, h=7+bottomThickness);
        back(38) right(38) color("gold")cylinder(d=8, h=7+bottomThickness);
        forward(38) left(38) color("gold")cylinder(d=8, h=7+bottomThickness);
        forward(38) right(38) color("gold")cylinder(d=8, h=7+bottomThickness);
        //snaptabs
        //back((caseDepthY/2)-1.8-1.5)  left((caseWidthX/2)/2) color("PeachPuff") cube([caseWidthX/2, 1.5, 2+bottomThickness]);
        //forward((caseDepthY/2)-1.8) left((caseWidthX/2)/2) color("PeachPuff") cube([caseWidthX/2, 1.5, 2+bottomThickness]);
        //left((caseWidthX/2)-1.8) forward((caseDepthY/2)/2) color("PapayaWhip") cube([1.5, caseDepthY/2, 2+bottomThickness]);
        //right((caseWidthX/2)-1.8-1.5) forward((caseDepthY/2)/2) color("PapayaWhip") cube([1.5, caseDepthY/2, 2+bottomThickness]);
      }
  
  
      //subtract out case mounting screw holes8
      back(38) left(38) #cylinder(d=2, h=14);
      back(38) right(38)  #cylinder(d=2, h=14);
      forward(38) left(38)  #cylinder(d=2, h=14);
      forward(38) right(38)  #cylinder(d=2, h=14);
      
      //screw head countersinks
      back(38) left(38)  #cylinder(d=4, h=2.5);
      back(38) right(38)  #cylinder(d=4, h=2.5);
      forward(38) left(38)  #cylinder(d=4, h=2.5);
      forward(38) right(38)  #cylinder(d=4, h=2.5);
  
}//difference

