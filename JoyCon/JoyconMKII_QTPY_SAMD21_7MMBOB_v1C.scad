include <BOSL/constants.scad>
use <BOSL/shapes.scad>

fileVersion = "7MM";

caseWidthX = 30;
caseDepthY = 40;
caseHeightZ = 18;
wallThickness = 3;
overlap = 1; // overlap ensures that subtractions go beyond the edges

stickScrewDiameter = 1.6; // M1.6*3 screw for attaching stick to case
breakoutScrewDiameter = 2; // M2 Screw (any head type) -- using new 4Layer breakout

caseScrewDiameter = 3; // M3 
caseScrewHeight = 12; // M3-12 mushroom head hex screw
caseScrewHeadDiameter = 5.25; // M3
caseScrewHeadHeight = 1.5; // M3 

includeCaseMounts = false; 

  
$fn=60; //circle smoothness
  
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
      cuboid([caseWidthX-wallThickness,caseDepthY-wallThickness,caseHeightZ-wallThickness], fillet=2, 
       p1=[-((caseWidthX-wallThickness)/2), -((caseDepthY-wallThickness)/2), (wallThickness/2)]);
      
      //subtract out the hole for the joystick
      color("pink")
       translate([0,0,(caseHeightZ-wallThickness-overlap)])
        cylinder( h=10 , d=15, center=true); //can't be less than 14.75, otherwise cap of stick won't fit.
      

    }//difference (base)

    //riser for QT PY board
    color("purple")
     translate([-5,-2.5,0])
      cube([10, 18, 3]);
   
    //bumper for board -- endstop
    color("violet")
     translate([-11, -4.5, 0])  
      cube([22, 2, 4.5]);
    //bumpers for micro pro board -- lower side
    color("violet")
     translate([-11, -2.5, 0]) 
      cube([2,5,4.5]);
    color("violet")
     translate([9, -2.5, 0]) 
      cube([2,5,4.5]);


    //mounting bars for joystick
    color("lime") //horz
     translate([-12, -14, caseHeightZ-wallThickness-1])
      cube([23, 4, 4]);
    color("lime") //vert
     translate([7.5, -14, caseHeightZ-wallThickness-1])
      cube([4, 25, 4]);
      
    //mount for joystick breakout board
    color("greenyellow")
     translate([-3, -18, caseHeightZ-wallThickness-5])
      cube([4,4,8]);

    if (includeCaseMounts) {
    //case screw mounts
    color("gold")
     translate([-12-2.5, -2.5, 1])
      cube([5,5,caseHeightZ-2]);
    color("gold")
     translate([+12-2.5, -2.5, 1])
      cube([5,5,caseHeightZ-2]);
    //case screw mount countersink strengthener
    color("PeachPuff")
     translate([-12-3, -4, 1])
      cube([7,8,wallThickness-1]);
    color("PeachPuff")
     translate([+12-4, -4, 1])
      cube([7,8,wallThickness-1]);

    }

    
  }//union
  
  // Start of Difference stuff

  //USB Micro cable outlet
  color("coral")
   translate([-5, 17, 4.5])
    # cube([10, (wallThickness*2), 4.25]);

  //screw holes for mounting joystick (inside upper lid)
  color("orange") //horz
   translate([-7.625, -11.5, caseHeightZ-wallThickness-4.5])
    cylinder(h=6, d=stickScrewDiameter);
  color("orange") //vert
   translate([8.75, 7.25, caseHeightZ-wallThickness-4.5])
    cylinder(h=6, d=stickScrewDiameter);
  
  //screw hole for mounting joystick breakout board (inside upper lid)
  color("orange")
   translate([-1, -16, caseHeightZ-wallThickness-7])
    cylinder(h=8, d=breakoutScrewDiameter);

  //carve out inside intersection of joystick mounting bars
  color("coral")
   translate([7.25, -9.75, caseHeightZ-wallThickness-4.5])
    cylinder(h=6, d=2);


  if (includeCaseMounts) {
    //screw hole for case (goes through bottom of case)
    color("tomato")
     translate([-12, 0, -overlap])
      cylinder(h=caseHeightZ-wallThickness-2, d=caseScrewDiameter);
    color("tomato")
     translate([+12, -0, -overlap])
      cylinder(h=caseHeightZ-wallThickness-2, d=caseScrewDiameter);
    //countersink
    color("darkorange")
     translate([-12, 0, -overlap])
      cylinder(h=caseScrewHeadHeight+overlap, d=caseScrewHeadDiameter);
    color("darkorange")
     translate([+12, -0, -overlap])  
      cylinder(h=caseScrewHeadHeight+overlap, d=caseScrewHeadDiameter);
  }//includeCaseMounts
 
  //-------------------------------------------------------------------------------------------------------

  splitAtZ=8.7; //size this so the hole for the usb is all on the bottom part (easier printing)
  
  //remove the top for split
  color("crimson")  translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  // ******* OR ******
  //Remove everything but the top
  //color("crimson") translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ-caseHeightZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);

  //-------------------------------------------------------------------------------------------------------
  
  
}//difference

//For bottom, add clips to hold enclosure together
translate([-13.75, -10, 0.5]) cube([1.5,20,11]);
translate([12.25, -10, 0.5]) cube([1.5,20,11]);
////translate([-10, -19, 0.5]) cube([20, 1.5, 11]); -- not used
