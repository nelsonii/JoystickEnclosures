include <BOSL/constants.scad>
use <BOSL/shapes.scad>
use <BOSL/transforms.scad>
use <BOSL/masks.scad>

$fn=240; //circle smoothness

height = 10;
fingerCutout = 20;


//left(20) holder2();
right(20) holder2mount();

//older versions: 
//left(fingerCutout) xrot(180) down(8) top();
//right(fingerCutout) bot();



module holder2mount() {
  sensorDia = 26;
  difference() {
    union() {
      color("teal") cylinder(h=8, d=sensorDia+5);
    }
  left((sensorDia/2)) cylinder(h=10, d=2.5); //alignment
  cylinder(h=10, d=sensorDia);
  up(5) forward(10/2) left((sensorDia+6)/2) cube([sensorDia+6, 10, 4]);
  up(3)forward(7/2) left((sensorDia+10)/2) #cube([10, 7, 2]);  
  }
}


module holder2() {
  difference() {  
  union() {
    color("lightblue") tube(h=height, id=fingerCutout, od=fingerCutout+5.8);
    forward(4) left(23) color("powderblue") tube(h=height, id=fingerCutout, od=fingerCutout+6);
    zrot(-35) left(31.5) forward(31.5) color("pink") cube([30, 5, height]);
    zrot(35) left(29) forward(8.1) color("plum") cube([19, 8, height]);
    left(38) forward(4) cylinder(h=height, d=9);
    }
    left(25) back(7) cylinder(h=height, d=26);
    //forward(2) left(36.25) cube([fingerCutout+3, (fingerCutout/2)+3, height]);
}}


module holder() {
    difference(){
      union() {
       color("lime") cylinder(h=height, d=fingerCutout+2.2); //disc object 1
       left(18) color("green") cylinder(h=height, d=fingerCutout+2.2); //disc object 1
      }
        color("aqua") cylinder(h=height, d=fingerCutout); //sensor cutout (full width)
        left(19) forward(2) color("blue") cylinder(h=height, d=fingerCutout); //sensor cutout (full width)
    }//difference
}

module ring() {
  difference() {
  union() {
    color("aqua") cylinder(h=1.2, d=fingerCutout+2.2); // lower disc
    color("lime") cylinder(h=6.3+1.2, d=fingerCutout); // center disc
  }
  // hollow out center disc (ie tube it)
  up(1.2) cylinder(h=10, d=fingerCutout-2); 
  //cutout for ribbon cable / connector
  left(7/2) down(10/2)  cube([7,1, 10]);

}
}
