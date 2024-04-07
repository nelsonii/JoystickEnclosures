include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

printPart="ALL"; // TOP, BOT, or else (ALL)


$fn=60; //circle smoothness

caseWidthX = 60;
caseDepthY = 60;
caseHeightZ = 18;
wallThickness = 1.5*2;
splitAtZ=9;

joyShift = 1; // Joystick is not centered on PCB, need to shift slightly

dummy=5;
overlap = 1; // overlap ensures that subtractions go beyond the edges
wiggle=0.1;

stickScrewDiameter = 1.6; // M1.6 screw for attaching stick to case
breakoutScrewDiameter = 3; // M3x8 (or shorter) Screw (any head type)

mountingScrewDiameter = 2.5; // M2.5
mountingScrewHeadDiameter = 5; // M2.5
mountingScrewHeadHeight = 2.7; // M2.5 
  
  
//MAIN 
difference(){
  union() {
    difference(){
      
      //base
      //rounded cuboid is from the BOSL library
      //I'm using p1 setting to zero bottom (z). X/Y are centered on 0,0,0
      color("steelblue")
      cuboid([caseWidthX,caseDepthY,caseHeightZ], fillet=2, 
       p1=[-(caseWidthX/2), -(caseDepthY/2), 0]);
      
      //subtract out the inner cuboid
      cuboid([caseWidthX-wallThickness,caseDepthY-wallThickness,caseHeightZ-wallThickness], fillet=0, 
       p1=[-((caseWidthX-wallThickness)/2), -((caseDepthY-wallThickness)/2), (wallThickness/2)]);

    }//difference (base)

    right(joyShift) back(5.5) qtpy();
  
    right(joyShift) stickMounts();

    //front of lid
    color("orange") translate([0,25,18-3]) cylinder(h=3, d=3);

 }//union
  
 
  
  // Start of Difference stuff

  //subtract out the hole for the joystick
  color("pink") translate([0,0,(caseHeightZ-wallThickness-overlap)]) cylinder( h=10 , d=30, center=true); 

  //USB-C cable outlet
  color("coral") translate([-5+joyShift, 26, 3.5]) cube([10, (wallThickness*2), 4.5]);

  right(joyShift) stickScrews();

  shadowline();

//-------------------------------------------------------------------------------------------------------
  if (printPart=="BOT") {
    color("crimson")  translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  }
  else if (printPart=="TOP") {  
    color("crimson") translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ-caseHeightZ-overlap])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
      }
  else {
    //no split
  }  
  
}//difference

//additions (stuff that would have been sliced off in the split)
  if (printPart=="BOT") { 
      clips();
  }
  else if (printPart=="TOP") {
    //nothing more needed 
  }
  else {
    //no split
    //do everything that would happen in "BOT" or "TOP"
      clips(); 
  }


module clips() {
color("sienna") translate([-28.5, -27, 0.5]) cube([1.5,10,splitAtZ+2]);
color("sienna") translate([27.0, -27, 0.5]) cube([1.5,10,splitAtZ+2]);
color("saddlebrown") translate([-28.5, +17, 0.5]) cube([1.5,10,splitAtZ+2]);
color("saddlebrown") translate([27.0, +17, 0.5]) cube([1.5,10,splitAtZ+2]);

color("brown") translate([-((60-wallThickness)/2), -28.5, 0.5]) cube([60-wallThickness, 1.5, splitAtZ+2]);
color("green") translate([-28.5, 27, 0.5]) cube([19.5+joyShift, 1.5, splitAtZ+2]);
color("yellow") translate([+9+joyShift, 27, 0.5]) cube([19.5-joyShift, 1.5, splitAtZ+2]);
  }



module stickMounts() {
    color("peru") back(10) left(13) cuboid([6,6,8.5], align=V_UP);
    color("peru") back(10) right(13) cuboid([6,6,8.5], align=V_UP);
    color("peru") forward(10) left(13) cuboid([6,6,8.5], align=V_UP);
    color("peru") forward(10) right(13) cuboid([6,6,8.5], align=V_UP);
}//stickmounts

module stickScrews() {
  color("purple") up(2) back(10) left(13) cyl(h=10, d=mountingScrewDiameter, align=V_UP);
  color("purple") up(2) back(10) right(13) cyl(h=10, d=mountingScrewDiameter, align=V_UP);
  color("purple") up(2) forward(10) left(13) cyl(h=10, d=mountingScrewDiameter, align=V_UP);
  color("purple") up(2) forward(10) right(13) cyl(h=10, d=mountingScrewDiameter, align=V_UP);  
}


module qtpy() {
     //riser for QT PY
    color("teal") translate([-(12/2), 2, 1]) cube([12,21,1.5]);
    //bumper for QT PY
    color("CadetBlue") translate([-(18/2), .5, 1]) cube([18, 1.5, 4]); 
    //side bumpers for QT PY
    color("royalblue") translate([-10.5, .5, 1]) cube([1.5, 22.25, 4]);
    color("royalblue") translate([+9, .5, 1]) cube([1.5, 22.25, 4]);
}

module shadowline() {
  shadow=1.5;
  up(splitAtZ) back(caseDepthY/2) cuboid([caseWidthX, shadow, shadow/4]);
  up(splitAtZ) forward(caseDepthY/2) cuboid([caseWidthX, shadow, shadow/4]);
  up(splitAtZ) left(caseWidthX/2) cuboid([shadow, caseDepthY, shadow/4]);
  up(splitAtZ) right(caseWidthX/2) cuboid([shadow, caseDepthY, shadow/4]);
}