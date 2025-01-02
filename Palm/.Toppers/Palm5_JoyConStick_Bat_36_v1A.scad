include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

 
$fn=120; //circle smoothness
 
 
difference(){
  union() {
    color("red") cylinder(h=5, d=16.5); //center shaft
    capH=25;
    color("salmon") up(capH) onion(r=12, maxang=10, cap_h=capH, orient=ORIENT_ZNEG);
    }
    color("lime") zrot(45) down(+1) cuboid([4,3,6+1], fillet=.5, align=V_UP);
  
}//difference


