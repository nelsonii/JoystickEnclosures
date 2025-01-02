include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=60; //circle smoothness

discTop = 35;
discBottom = 55;
discHeight = 10;

union() {
  difference() {
    color("blue") cyl(d1=discTop, d2=discBottom, h=discHeight, align=V_UP); // core shape
    color("pink") tube(id=discBottom-2, od=discBottom, h=discHeight, align=V_UP); // flatten edge
  }
  difference() {
    up(discHeight) color("yellow") cyl(d1=12, d2=8, h=10, align=V_UP);
    up(discHeight+10-4) color("lime") zrot(45) cuboid([4,3,5], fillet=.5, align=V_UP);
  }
}

//down(0.5) color("lime") zrot(45) #cuboid([4,3,5], fillet=.5, align=V_UP);
