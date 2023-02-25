include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

fileVersion = "1A";

caseWidthX = 88.9; // 3.5"
caseDepthY = 88.9; // 3.5"
caseHeightZ = 14; 
wallThickness = 3.2;
overlap = 1; // overlap ensures that subtractions go beyond the edges

mountingScrewDiameter = 2.5; // M2.5
mountingScrewHeadDiameter = 5; // M2.5
mountingScrewHeadHeight = 2.7; // M2.5 
  
$fn=60; //circle smoothness

shiftBack = 0;


 
difference(){
      
      //base
      //rounded cuboid is from the BOSL library
      //I'm using p1 setting to zero bottom (z). X/Y are centered on 0,0,0
      //, edges=EDGES_TOP + EDGES_Z_ALL
      color("steelblue")
      cuboid([caseWidthX,caseDepthY,caseHeightZ], fillet=2,  
       p1=[-(caseWidthX/2), -(caseDepthY/2), 0]);

      //subtract out the hole for the touchpad
      cuboid([68,52,10], fillet=5); 
      //down(1) cylinder(d=50.8, h=5); // 2"
      
      //subtract out space for display
      up(6.5) cuboid([77, 63, 10]);
  
      //subtract out notch for display cable
      forward(34-0.1) left((20/2)+8) up(6.5) cuboid([20,5,10]);
  
      //subtract out back cover for display
      up(7.75) cuboid([85, 85, 10]);

      //subtract out mounting screw holes
      back(35) up(1) #cylinder(d=2, h=10);
      forward(35) up(1) #cylinder(d=2, h=10);
      left(40.5) up(1) #cylinder(d=2, h=10);
      right(40.5) up(1) #cylinder(d=2, h=10);
      
      //subtract out case mounting screw holes
      back(38) left(38) up(1) #cylinder(d=2, h=10);
      back(38) right(38) up(1) #cylinder(d=2, h=10);
      forward(38) left(38) up(1) #cylinder(d=2, h=10);
      forward(38) right(38) up(1) #cylinder(d=2, h=10);
     
     //unremark for alignment help
     //up(1.5) right(22) back(31) color("lightgreen") #cuboid([12,22.5,3]); // QT mount 
     //subtract out USB port
     right(22) up(9.75) back((caseDepthY/2)) #cuboid([10, (wallThickness*2), 4.5]);

  //-------------------------------------------------------------------------------------------------------

  splitAtZ=12; 
  color("crimson")  translate([-((caseWidthX+overlap)/2),-((caseDepthY+overlap)/2),splitAtZ])  cube([caseWidthX+overlap, caseDepthY+overlap, caseHeightZ+overlap]);
  //-------------------------------------------------------------------------------------------------------
  
  
}//difference

//for checking fit of case screws
//back(38) left(38) color("gold") cylinder(d=7, h=7);


