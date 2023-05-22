include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>


caseWidthX = 75;
caseDepthY = 75;
caseHeightZ = 30;
wallThickness = 4;

overlap = 1; // overlap ensures that subtractions go beyond the edges
falseBottom = -0.1; //0.6; // if I want a thin skin at bottom for easier printing

//M2.5*5 
stickScrewDiameter = 2.5; 
stickScrewHeadDiameter = 4.5;

//M3*12 (originally joycon enclosure)
caseScrewDiameter = 3.0;
caseScrewHeadDiameter = 5.2; 
caseScrewThreadHeight = 12;
caseScrewHeadHeight = 2.0;

 $fn=60; //circle smoothness
 splitAtZ=15; 
 
 printPart = "TOP"; // TOP, BOT, or else (ALL)
 debugPart = "NO"; // YES or else, YES will "skeletonize"
 
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
      cuboid([caseWidthX-wallThickness,caseDepthY-wallThickness,caseHeightZ-wallThickness-0], fillet=0, 
       p1=[-((caseWidthX-wallThickness)/2), -((caseDepthY-wallThickness)/2), (wallThickness/2)]);
      
      //subtract out the hole for the joystick
      color("pink") translate([0,0,(caseHeightZ-wallThickness-overlap)]) cylinder( h=12 , d=30, center=true); 

    }//difference (base)
    
    stickMounts();
    caseMountsBottom();
    
 }//union
  
  // Start of Difference stuff

  //IR/PWR TRRS Jack -- round black barrel one
 //back(36) left(15) up(8) #ycyl(h=6, d=8.2);
 //back(36) left(20) up(8) #ycyl(h=6, d=8.2);
 back(36) up(8) #ycyl(h=6, d=8.2);

  //IR/PWR TRRS Jack -- round black barrel one
 //not needed for slider -- can't get to the button
 //back(36) right(20) up(8) #ycyl(h=6, d=8.2);

  stickScrews();
  caseScrews();

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

  //"debug" is just cutting out extra material -- so i can see inside :-)
  if (debugPart=="YES") {
    if (printPart=="TOP") {
      #cuboid([80, 50, caseHeightZ+20]);
      #cuboid([50, 80, caseHeightZ+20]);
    }
    if (printPart=="BOT") { 
      up(12) #cuboid([80, 50, 10]);
      up(12) #cuboid([50, 80, 10]);
    }
  }

  //-------------------------------------------------------------------------------------------------------
  
}//difference

//additions (stuff that would have been sliced off in the split)
  if (printPart=="BOT") { 
    //nothing more needed
  }
  else if (printPart=="TOP") {
    difference() { caseMountsTop(); caseScrews(); }
  }
  else {
    //no split
    //do everything that would happen in "BOT" or "TOP"
    difference() { caseMountsTop(); caseScrews(); }
    }



module stickMounts() {
  shift=1; // the joystick mechanism is not centered on the PCB, so shift the whole thing over
    color("peru") up(6/2) back(13.5) left(10-shift) cuboid([5,5,6]);
    color("peru") up(6/2) back(13.5) right(10+shift) cuboid([5,5,6]); 
    color("peru") up(6/2) forward(13.5) left(10-shift) cuboid([5,5,6]);  
    color("peru") up(6/2) forward(13.5) right(10+shift) cuboid([5,5,6]);
    color("rosybrown") up(6/2) right(+shift) cyl(h=6, d=8); // additional support
    color("brown") up(6/2) forward(5)  right(+shift) cuboid([5,16,6]); //additional support (Y)
    color("rosybrown") up(6/2) right(+shift) forward(11.5) cuboid([16,3,6]); // additional support (XYF)
    color("rosybrown") up(6/2) right(+shift) back(13.5) cuboid([16,5,6]); // additional support (XB)
}//stickmounts


module stickScrews() {
  shift=1; // the joystick mechanism is not centered on the PCB, so shift the whole thing over
    color("purple") up(2) back(13.5) left(10-shift) cylinder(h=8, d=stickScrewDiameter);
    color("purple") up(2) back(13.5) right(10+shift) cylinder(h=8, d=stickScrewDiameter);
    color("purple") up(2) forward(13.5) left(10-shift) cylinder(h=8, d=stickScrewDiameter);
    color("purple") up(2) forward(13.5) right(10+shift) cylinder(h=8, d=stickScrewDiameter);
}


module caseMountsBottom() {
    //up(4) color("lime") cylinder(h=14+overlap, d=caseScrewDiameter);
    underhang = 2;
    cubeHeight = splitAtZ;
    color("tan") up(cubeHeight/2-(underhang/2)) back(32) left(32) cuboid([7,7,cubeHeight-underhang]);
    color("tan") up(cubeHeight/2-(underhang/2)) back(32) right(32) cuboid([7,7,cubeHeight-underhang]); 
    color("tan") up(cubeHeight/2-(underhang/2))forward(32) left(32) cuboid([7,7,cubeHeight-underhang]);  
    color("tan") up(cubeHeight/2-(underhang/2)) forward(32) right(32) cuboid([7,7,cubeHeight-underhang]);
}

module caseMountsTop() {

    overhang = 2;
    cubeHeight = caseHeightZ-splitAtZ;
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(overhang/2)) back(32) left(32) cuboid([7,7,cubeHeight+overhang]);
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(overhang/2)) back(32) right(32) cuboid([7,7,cubeHeight+overhang]);
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(overhang/2)) forward(32) left(32) cuboid([7,7,cubeHeight+overhang]);
    color("sienna") up(((cubeHeight/2)+splitAtZ)-(overhang/2)) forward(32) right(32) cuboid([7,7,cubeHeight+overhang]);

}


module caseScrews() {
  //screw
  color("purple") up(falseBottom) back(32) left(32) #cylinder(h=caseHeightZ-3, d=caseScrewDiameter);
  color("purple") up(falseBottom) back(32) right(32) #cylinder(h=caseHeightZ-3, d=caseScrewDiameter);
  color("purple") up(falseBottom) forward(32) left(32) #cylinder(h=caseHeightZ-3, d=caseScrewDiameter);
  color("purple") up(falseBottom) forward(32) right(32) #cylinder(h=caseHeightZ-3, d=caseScrewDiameter);
  //countersink
  color("purple") up(falseBottom) back(32) left(32) #cylinder(h=caseScrewHeadHeight+falseBottom+6, d=caseScrewHeadDiameter);
  color("purple") up(falseBottom) back(32) right(32) #cylinder(h=caseScrewHeadHeight+falseBottom+6, d=caseScrewHeadDiameter);
  color("purple") up(falseBottom) forward(32) left(32) #cylinder(h=caseScrewHeadHeight+falseBottom+6, d=caseScrewHeadDiameter);
  color("purple") up(falseBottom) forward(32) right(32) #cylinder(h=caseScrewHeadHeight+falseBottom+6, d=caseScrewHeadDiameter);

}
