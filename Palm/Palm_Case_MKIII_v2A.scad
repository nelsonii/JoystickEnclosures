include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

//Palm_v1A
fileVersion = "1D";

caseWidthX = 60;
caseDepthY = 60;
caseHeightZ = 18;
wallThickness = 3;
overlap = 1; // overlap ensures that subtractions go beyond the edges

stickScrewDiameter = 1.6; // M1.6 screw for attaching stick to case
breakoutScrewDiameter = 3; // M3x8 (or shorter) Screw (any head type)

mountingScrewDiameter = 2.5; // M2.5
mountingScrewHeadDiameter = 5; // M2.5
mountingScrewHeadHeight = 2.7; // M2.5 

  
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
        cylinder( h=10 , d=27, center=true); 
      

    }//difference (base)

    //riser for QT PY board
    color("purple")
     translate([-6,8,0])
      cube([12, 18, 2.5]);
   
    //bumper for board -- endstop
    color("violet")
     translate([-(18/2), 5.5, 1])  
      cube([18, 2, 4.5]);
    
        //side bumpers for QT PY
    color("royalblue") translate([-10.5, 5.5, 1]) cube([1.5, 21, 4.5]);
    color("royalblue") translate([+9, 5.5, 1]) cube([1.5, 21, 4.5]);


  stickMounts();

    //front of lid
    color("orange")
     translate([0,25,18-2])
     cylinder(h=2, d=3);

 }//union
  
 
  
  // Start of Difference stuff

  //USB-C cable outlet
  color("coral")
   translate([-5, 26, 3.5])
    cube([10, (wallThickness*2), 4.25]);

    //stick screws
    color("purple") up(2) back(6+mountingScrewDiameter) left(16-mountingScrewDiameter) cylinder(h=10, d=mountingScrewDiameter);
    color("purple") up(2) back(6+mountingScrewDiameter) right(11+mountingScrewDiameter) cylinder(h=10, d=mountingScrewDiameter);
    color("purple") up(2) forward(14-mountingScrewDiameter) left(16-mountingScrewDiameter) cylinder(h=10, d=mountingScrewDiameter);
    color("purple") up(2) forward(14-mountingScrewDiameter) right(11+mountingScrewDiameter) cylinder(h=10, d=mountingScrewDiameter);


  //-------------------------------------------------------------------------------------------------------

  splitAtZ=9; //size this so the hole for the usb is all on the bottom part (easier printing)
  
  //remove the top for split
  color("crimson")  translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  // ******* OR ******
  //Remove everything but the top
  //color("crimson") translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ-caseHeightZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  //-------------------------------------------------------------------------------------------------------
  
  
}//difference


//For bottom, add clips to hold enclosure together
translate([-28.5, -15, 0.5]) cube([1.5,30,10]);
translate([27.0, -15, 0.5]) cube([1.5,30,10]);
translate([-15, -28.5, 0.5]) cube([30, 1.5, 10]);


module stickMounts() {
    color("peru") back(5.5) left(16.5) cube([6,6,8.5]);
    color("peru") back(5.5) right(10.5) cube([6,6,8.5]);
    color("peru") forward(14.5) left(16.5) cube([6,6,8.5]);
    color("peru") forward(14.5) right(10.5) cube([6,6,8.5]);
}//stickmounts


