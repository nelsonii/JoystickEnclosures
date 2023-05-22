include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>


caseWidthX = 150;
caseDepthY = 30;
caseHeightZ = 17;
wallThickness = 3.5;

caseMountY = 9.25;
caseMountX = 69.25;
mountXY = 8;

featherScrewDiameter = 2.5; //M2.5*5
featherMountX = 45.7;
featherMountY = 17.8;


overlap = 1; // overlap ensures that subtractions go beyond the edges

caseScrewDiameter = 3.0;
caseScrewHeadDiameter = 5.1; 
caseScrewThreadHeight = 12;
caseScrewHeadHeight = 1.9 + 0.3;

 $fn=60; //circle smoothness
 splitAtZ=6; 
 
 printPart = "TOP"; // TOP, BOT, or else (ALL)
 
difference(){
  union() {
    difference(){
      
      //base
      //rounded cuboid is from the BOSL library
      //I'm using p1 setting to zero bottom (z). X/Y are centered on 0,0,0
      //, edges=EDGES_Z_ALL+EDGES_TOP
      color("steelblue")
      cuboid([caseWidthX,caseDepthY,caseHeightZ], fillet=2, 
       p1=[-(caseWidthX/2), -(caseDepthY/2), 0]);
      
      //subtract out the inner cuboid
      cuboid([caseWidthX-wallThickness,caseDepthY-wallThickness,caseHeightZ-wallThickness-0], fillet=0, 
       p1=[-((caseWidthX-wallThickness)/2), -((caseDepthY-wallThickness)/2), (wallThickness/2)]);
      
    }//difference (base)

    featherMount();
    caseMountsTop();

 }//union
  
  // Start of Difference stuff

  cableSlots();
  caseScrews(); 
  featherAccess();

  //-------------------------------------------------------------------------------------------------------
  
  if (printPart=="BOT") { 
    color("crimson")  translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  }
  else if (printPart=="TOP") {
    color("crimson") translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ-caseHeightZ-1])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  }
  else {
    //no split
    }
  
  //-------------------------------------------------------------------------------------------------------
  
}//difference


//additions (stuff that would have been sliced off in the split)
  if (printPart=="BOT") { 
    difference() { caseMountsBottom(); }
  }
  else if (printPart=="TOP") {
    //nothing added beyond split
  }
  else {
    difference() { caseMountsBottom(); }
  }

//-------------------------------------------------------------------------------------------------------

module featherMount() {
  difference() {
    union() {
      up(5/2) left(featherMountX/2) color("steelblue") cuboid([5, (caseDepthY-wallThickness), 5]);
      up(5/2) right(featherMountX/2) color("steelblue") cuboid([5, (caseDepthY-wallThickness), 5]);
    }
      up(2) left(featherMountX/2) back(featherMountY/2) cylinder(h=4, d=featherScrewDiameter); // feather mount hole
      up(2) right(featherMountX/2) back(featherMountY/2) cylinder(h=4, d=featherScrewDiameter); // feather mount hole
      up(2) left(featherMountX/2) forward(featherMountY/2) cylinder(h=4, d=featherScrewDiameter); // feather mount hole
      up(2) right(featherMountX/2) forward(featherMountY/2) cylinder(h=4, d=featherScrewDiameter); // feather mount hole
  }
}//featherMount

//-------------------------------------------------------------------------------------------------------

module featherAccess() {
    right(10) back(7) up(caseHeightZ-5) #cylinder(h=10, d=5); // boot
    right(10+6) back(7) up(caseHeightZ-5) #cylinder(h=10, d=5); // reset
    left(3) back(6) up(caseHeightZ-5) #cylinder(h=10, d=2); // pixel
    left(13) forward(7) up(caseHeightZ-5) #cylinder(h=10, d=2); // green power led
}

//-------------------------------------------------------------------------------------------------------

module bottomCableGrabs() {
  difference() {
  union() {
    up(12/2+1) left((caseWidthX/2)-(wallThickness/2)) color("lightblue") cuboid([(wallThickness/2), (caseDepthY-wallThickness), 11]);
    up(12/2+1) right((caseWidthX/2)-(wallThickness/2)) color("lightblue") cuboid([(wallThickness/2), (caseDepthY-wallThickness), 11]);
  }
  up(11)  #cuboid([caseWidthX, 5, 3]);
  up(9) left(caseWidthX/2) yrot(90) #cylinder(d=5, h=caseWidthX);
  }
}//bottomCableGrabs

//-------------------------------------------------------------------------------------------------------

module cableSlots() {
  up(7) cuboid([caseWidthX+(overlap*2), 5, 2]);
  up(8) left((caseWidthX/2)+overlap) yrot(90) cylinder(d=5, h=caseWidthX+(overlap*2));
}

//-------------------------------------------------------------------------------------------------------

module caseMountsBottom() {
    hang = 2;
    cubeHeight = splitAtZ;
    color("tan") up(cubeHeight/2-(hang/2)+2) back(9.25) left(caseMountX) cuboid([mountXY,mountXY,cubeHeight+hang-1]);
    color("tan") up(cubeHeight/2-(hang/2)+2) back(9.25) right(caseMountX) cuboid([mountXY,mountXY,cubeHeight+hang-1]); 
    color("tan") up(cubeHeight/2-(hang/2)+2)forward(9.25) left(caseMountX) cuboid([mountXY,mountXY,cubeHeight+hang-1]);  
    color("tan") up(cubeHeight/2-(hang/2)+2) forward(9.25) right(caseMountX) cuboid([mountXY,mountXY,cubeHeight+hang-1]);
}

module caseMountsTop() {

    hang = 2;
    cubeHeight = caseHeightZ-splitAtZ;
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(hang/2)+1.5) back(caseMountY) left(caseMountX) cuboid([mountXY,mountXY,cubeHeight-hang-1]);
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(hang/2)+1.5) back(caseMountY) right(caseMountX) cuboid([mountXY,mountXY,cubeHeight-hang-1]);
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(hang/2)+1.5) forward(caseMountY) left(caseMountX) cuboid([mountXY,mountXY,cubeHeight-hang-1]);
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(hang/2)+1.5) forward(caseMountY) right(caseMountX) cuboid([mountXY,mountXY,cubeHeight-hang-1]);

}


module caseScrews() {
  //screw
  color("purple") up(2) back(caseMountY) left(caseMountX) #cylinder(h=caseHeightZ, d=caseScrewDiameter);
  color("purple") up(2) back(caseMountY) right(caseMountX) #cylinder(h=caseHeightZ, d=caseScrewDiameter);
  color("purple") up(2) forward(caseMountY) left(caseMountX) #cylinder(h=caseHeightZ, d=caseScrewDiameter);
  color("purple") up(2) forward(caseMountY) right(caseMountX) #cylinder(h=caseHeightZ, d=caseScrewDiameter);
  //countersink
  //Now on the top, so users can easily change cables
  color("purple") up(caseHeightZ-caseScrewHeadHeight) back(caseMountY) left(caseMountX) #cylinder(h=caseScrewHeadHeight+overlap, d=caseScrewHeadDiameter);
  color("purple") up(caseHeightZ-caseScrewHeadHeight) back(caseMountY) right(caseMountX) #cylinder(h=caseScrewHeadHeight+overlap, d=caseScrewHeadDiameter);
  color("purple") up(caseHeightZ-caseScrewHeadHeight) forward(caseMountY) left(caseMountX) #cylinder(h=caseScrewHeadHeight+overlap, d=caseScrewHeadDiameter);
  color("purple") up(caseHeightZ-caseScrewHeadHeight) forward(caseMountY) right(caseMountX) #cylinder(h=caseScrewHeadHeight+overlap, d=caseScrewHeadDiameter);

}


