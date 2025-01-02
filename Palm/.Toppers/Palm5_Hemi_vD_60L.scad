//ode to PI
include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
$fn=60; //circle smoothness
brassInsertHeight = 5.7; brassInsertDiam = 4.0; brassInsertLip = 4.2;

diam=60; insert = "SCREW"; // SCREW/BRASS/NONE

screwDiameter = 1.5;
screwHeadDiameter = 2.7;
  
difference(){
  union() {
    difference(){
      color("steelblue") top_half() sphere(d=diam); //exterior
      down(PI) color("lightblue") sphere(d=diam-(PI*(PI/2))); //interior
    }
    color("red") cyl(h=(diam/2)-PI, d1=10, d2=(diam/PI), align=V_UP); //center shaft
    color("pink") rotate([0,0,135]) cuboid([diam-PI,1.6,1.6], align=V_UP); //shaft support 
    }
    if (insert=="BRASS") {
      //brass insert     
      color("lime") zcyl(h=brassInsertHeight, d=brassInsertDiam, align=V_UP);
      color("olive") zcyl(h=0.5, d=brassInsertLip, align=V_UP);
    }
    else if (insert=="SCREW") {
      color("lime") zcyl(h=5, d=screwDiameter, align=V_UP);
    }
    else {
      //joy post cutout     
      color("lime") zrot(45) down(+1) cuboid([4,3,6+1], fillet=.5, align=V_UP);
    }
}//difference


