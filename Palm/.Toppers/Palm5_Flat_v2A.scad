include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=60; //circle smoothness

discDiam = 55;
discHeight = 7;

difference(){
    union() {
      color("lime") cylinder(h=discHeight, d=discDiam); //disc
      difference() {
        down(5) color("yellow") cyl(d1=8, d2=12, h=5, align=V_UP);
        down(5+1) color("lime") zrot(45) #cuboid([4,3,5], fillet=.5, align=V_UP);
      }
    }
    color("pink") up(8) fillet_cylinder_mask(r=discDiam/2, fillet=9); //disc round over
}//difference
