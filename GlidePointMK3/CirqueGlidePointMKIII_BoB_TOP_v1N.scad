include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=120; //circle smoothness

sensorCutout = 35.25;
snapLipOverlap = 6.5;

controller = false;
height = 10;
// *OR*
//controller = true; // true=this is a controller board (for mini) -- false=regular setup 
//height = 12;


xrot(180) down(height)

union() {  
  difference(){
     color("lime") cylinder(h=height, d=sensorCutout+3.25); //disc object
        if (controller) {
          color("aqua") cylinder(h=height-2, d=sensorCutout); //sensor cutout (not used -- stiffen to 2 mm)
          //color("peru") up(height-3.9) cylinder(h=4, d1=5, d2=2); // peep hole for LED -- covered version
        }
        if (!controller) {
          color("aqua") cylinder(h=height-1, d=sensorCutout); //sensor cutout (full width)
          color("peru") up(height-3) cylinder(h=height/2, d=sensorCutout-3); // touchable sensor surface
        }
      if (!controller) {
        color("orange") translate([-(13/2), (sensorCutout/2)-5, 0]) cube([13,10,7]); //usb cutout
      }
      else {
        color("orange") translate([-(13/2), (sensorCutout/2)-5, 0]) cube([13,10,9]); //usb cutout
      }
      color("red") cylinder(h=snapLipOverlap+1, d=sensorCutout+1); // snap lip

     //back(3.14) up(height-1.75) triforce();  
    
  }//difference

  // MKIII GlidePoint alignment (sides)
  if (!controller) {
    tabHeight = height-snapLipOverlap;
    color("blue")   up(height-(tabHeight/2)) left(17.5) cuboid([1, 7, tabHeight]); 
    color("blue")  up(height-(tabHeight/2)) right(17.5) cuboid([1, 7, tabHeight]); 
  }

}

module triforce() {
   #prismoid(size1=[10,1], size2=[0,1], h=10, orient=ORIENT_Y);
   left(5) forward(10) #prismoid(size1=[10,1], size2=[0,1], h=10, orient=ORIENT_Y);
   right(5) forward(10) #prismoid(size1=[10,1], size2=[0,1], h=10, orient=ORIENT_Y);
}
