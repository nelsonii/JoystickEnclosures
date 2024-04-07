include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>

// PRINT WITH A Skirt/Brim
// Layers: 1, Offset: 0.20, Outlines: 5

// no longer using raft
// //RECOMMEND PRINTING THIS WITH A RAFT FOR STABILITY
// //Base 1, Top 1, offset/expand 3mm, separation 0.20
  
$fn=60; //circle smoothness

stickOverlap=5; // how much the stick mechanism sticks in the bottom
core=13; // core stick, up to powerchair stick
pc=10; // how much of the stick goes into the powerchair stick

difference() {
  union() {
    
    //color("purple") cyl(h=stickOverlap, d=7, align=V_UP);
    //color("red") cyl(h=stickOverlap+core, d=6, align=V_UP);
    color("orange") cyl(h=stickOverlap+core, d1=7, d2=10, align=V_UP);
    
    color("pink") cyl(h=stickOverlap+core+pc, d=5, align=V_UP);
  }
    color("lime") zrot(45) down(+1) cuboid([4,3,5+1], fillet=.5, align=V_UP);

}

