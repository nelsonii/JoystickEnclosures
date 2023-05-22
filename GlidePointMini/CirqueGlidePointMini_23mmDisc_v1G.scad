include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=120; //circle smoothness

height = 8;
sensorCutout = 23.5;

//left(sensorCutout) xrot(180) down(8) top();
right(sensorCutout) bot();

module top() {
    difference(){
      union() {
       color("lime") cylinder(h=height, d=sensorCutout+2.2); //disc object
       left((sensorCutout/2)+1) color("green") cylinder(h=height, d=2); //alignment (external)
      }
        color("aqua") cylinder(h=height-0.6, d=sensorCutout); //sensor cutout (full width)
        color("peru") up(height-3) cylinder(h=height/2, d=sensorCutout-2.6); // touchable sensor surface
    }//difference
}

module bot() {
  difference() {
  union() {
    color("aqua") cylinder(h=1.2, d=sensorCutout+2.2); // lower disc
    color("lime") cylinder(h=6.3+1.2, d=sensorCutout); // center disc
  }
  // hollow out center disc (ie tube it)
  up(1.2) cylinder(h=10, d=sensorCutout-2); 

  //BOTTOM cutout for ribbon cable / connector
  //left(7/2) forward(1/2) down(10/2)  cube([7,1, 10]);
  //left(1/2) forward(7/2) down(10/2)  cube([1,7, 10]);
  //SIDE cutout for ribbon cable / connector
  yrot(10) up(3) forward(7/2) right(5) cube([10,7, 7]);

}
right(8.75) forward(13/2) color("pink") cube([1,13, 5]); //cable trap
}
