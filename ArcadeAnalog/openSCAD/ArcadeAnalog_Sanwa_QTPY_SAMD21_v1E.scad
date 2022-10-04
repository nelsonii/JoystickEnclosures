
//The Belfry OpenSCAD Library
//https://github.com/revarbat/BOSL
include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

$fn=60;

caseWidthX = 105;
caseDepthY = 72;
caseHeightZ = 53;
wallThickness = 6;

overlap = 1; // overlap ensures that subtractions go beyond the edges


//MAIN 
union() {
difference(){
  base();
  //minus...
  usb();
  joyhole();
  joymount();
  frontmarker();
  split();
}
  //clips();
}

module base() {


    difference() {
      union() {
        color("steelblue") cuboid([caseWidthX,caseDepthY,caseHeightZ], fillet=3, p1=[-(caseWidthX/2), -(caseDepthY/2), 0]);
        mountingtabs();
      }
      //subtract out the inner cuboid
      cuboid([caseWidthX-wallThickness,caseDepthY-wallThickness,caseHeightZ-wallThickness-0], fillet=0, 
       p1=[-((caseWidthX-wallThickness)/2), -((caseDepthY-wallThickness)/2), (wallThickness/2)]);
    }
    
    //riser for QT PY board
    color("purple") translate([-6-30,13,0]) cube([12, 18, (wallThickness/2)+0.5]);
   
    //bumper for board -- endstop
    color("violet") translate([-(18/2)-30, 10.5, 0]) cube([18, 2, (wallThickness/2)+2.5]);
    
    //side bumpers for QT PY
    color("royalblue") translate([-10.5-30, 10.5, 0]) cube([1.5, 23, (wallThickness/2)+5]);
    color("royalblue") translate([+9-30, 10.5, 0]) cube([1.5, 23, (wallThickness/2)+5]);
    
   
}


module usb(){

  //USB-C cable outlet
  color("coral")
   translate([-5-30, (caseDepthY/2)-3, (wallThickness/2)+1.5])
    cube([10, (wallThickness*2), 4.5]);
}


module frontmarker() {
  color("pink") translate([0, 32.5, 8]) cube([1.5, 1.5, 3]);
}

module clips() {
//For bottom, add clips to hold enclosure together
translate([-49.5, -15, 0.5]) cube([1.5,30,11]); //left
translate([+48.0, -15, 0.5]) cube([1.5,30,11]); //right
translate([-30, -33, 0.5]) cube([15, 1.5, 11]); //front-left
translate([+15, -33, 0.5]) cube([15, 1.5, 11]); //front-left
translate([-30+13, 31.5, 0.5]) cube([15, 1.5, 11]); //back-left
translate([+15+10, 31.5, 0.5]) cube([15, 1.5, 11]); //back-left
  
}

module joyhole() {
  translate([0,0,(caseHeightZ)]) cylinder( h=20 , d=20, center=true); 
}//joyhole


module joymount() {
  translate([-40, -20, (caseHeightZ)]) cylinder (h=20, d=5, center=true); //front left
  translate([+40, -20, (caseHeightZ)]) cylinder (h=20, d=5, center=true); //front right
  translate([-40, +20, (caseHeightZ)]) cylinder (h=20, d=5, center=true); //back left
  translate([+40, +20, (caseHeightZ)]) cylinder (h=20, d=5, center=true); //back right
}//joymount


module mountingtabs() {
  
    //6.5mm fill fit a 1/4" bolt
  
    difference() {
      color("green") cuboid([caseWidthX+26, caseDepthY-20, 4], fillet=1, p1=[-(caseWidthX/2)-13, -(caseDepthY/2)+10, 0]);
      translate([-(caseWidthX/2)-6, 15, 2.5]) cylinder(h=10, d=6.5, center=true);
      translate([-(caseWidthX/2)-6, -15, 2.5]) cylinder(h=10, d=6.5, center=true);
      translate([(caseWidthX/2)+6, 15, 2.5]) cylinder(h=10, d=6.5, center=true);
      translate([(caseWidthX/2)+6, -15, 2.5]) cylinder(h=10, d=6.5, center=true);
      
      }
}


module split(){

  //-------------------------------------------------------------------------------------------------------

  splitAtZ=9; //size this so the hole for the usb is all on the bottom part (easier printing)
  
  //remove the top for split
  //color("crimson")  translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  // ******* OR ******
  //Remove everything but the top
  //shifted the X and the width of X to account for mounting tab removal
  color("crimson") translate([-((caseWidthX+overlap)/2)-20,-((caseDepthY+overlap)/2),splitAtZ-caseHeightZ])  cube([caseWidthX+overlap+40, caseDepthY+overlap, caseHeightZ+overlap]);
  //-------------------------------------------------------------------------------------------------------

  //-------------------------------------------------------------------------------------------------------
}//split 
