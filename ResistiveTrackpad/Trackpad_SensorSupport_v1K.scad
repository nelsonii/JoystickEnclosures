include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
$fn=60; //circle smoothness

supportThickness = 2.2;

difference(){



      //back cover for sensor/display
      up(supportThickness/2) color("orange") cuboid([84.5, 84.5, supportThickness]);
  
      //subtract out notch for display cable -- the 0.4 add-on allows for cleaner printing
      //forward(33-0.1) right((20/2)+8) up(1.1+0.4) #cuboid([20,6,2.2]);
      forward(37) left((20/2)+8) up(1.1+0.4) #cuboid([20,14,2.2]);
  
     //subtract out mounting screw holes
     // the 0.2 add-on allows for cleaner printing
     back(35) up(0.2) #cylinder(d=2, h=3);
     forward(35) up(0.2) #cylinder(d=2, h=3);
     left(40.5) up(0.2) #cylinder(d=2, h=3);
     right(40.5) up(0.2) #cylinder(d=2, h=3);
  
      //subtract out case mounting screw holes
      // the 0.2 add-on allows for cleaner printing
      back(38) left(38) up(0.2) #cylinder(d=2, h=10);
      back(38) right(38) up(0.2) #cylinder(d=2, h=10);
      forward(38) left(38) up(0.2) #cylinder(d=2, h=10);
      forward(38) right(38) up(0.2) #cylinder(d=2, h=10);
  
}//difference

sensorMount();
QTPyMount();


module sensorMount()
{
  difference() {
      up(2.5) left(19) back(25) color("steelblue") cuboid([26,20,4]); // sensor mount
      up(2) left(9) back(32) #cylinder(h=3, d=2); // sensor mount hole
      up(2) left(9+20) back(32) #cylinder(h=3, d=2); // sensor mount hole
      up(2) left(9) back(18) #cylinder(h=3, d=2); // sensor mount hole
      up(2) left(9+20) back(18) #cylinder(h=3, d=2); // sensor mount hole
  }
}

module QTPyMount()
{
  up(1.5) right(22) back(31) color("lightgreen") cuboid([12,22.5,3]); // QT mount 
  right(12.4) back(30) up(3) color("royalblue") cuboid([1.5,22,6]); // left
  right(31.7) back(30) up(3) color("royalblue") cuboid([1.5,22,6]); // right
  right(22) back(20) up (3) color("purple") cuboid([19,2,2]); // endstop base
  right(14) back(20) up (3) color("violet") cuboid([2.5,2,6]);
  right(28) back(20) up (3) color("violet") cuboid([6.7,2,6]);
}