//// Redukce ke spojce pro osu X

$fn=100;
/// Parametry

//U mikroskopu
dvd = 54; // Vnější průměr disku
hd = 3;  //Výška disku
dvv = 38;  // Vnější průměr válce
dvn = 35.4; // Vnitrřní průměr klobouku (průměr díry)
hm = 23; //Výška klobouku

// Díry na šrouby
rs = 20; // Vzdálenost děr na šrouby od středu
dd = 2.2; // Průměr dírky na šroub

d3h = 3.4;      // Díry hlavy šroubu
h3h = 20;      // delka prostoru pro hlavu sroubu

// Do spojky
ds = 8; // Průměr konce ve spojce
hs = 15; // Délka osy do spojky

module klobouk(){
difference() {
    union() {
cylinder(hd, dvd/2, dvd/2);
cylinder(hm, dvv/2, dvv/2);      
    }
    
translate([0,0,0])
cylinder(hm-3.5, dvn/2, dvn/2-6.4);
}

}

module srouby(){
    
    translate([rs, 0, 0])
       cylinder(30, dd/2, dd/2, center = true);
    translate([rs, 0, hd]) cylinder(h=h3h, d=d3h);
     
    
    rotate(120) {
    translate([rs, 0, 0])
    cylinder(30, dd/2, dd/2, center = true);
    translate([rs, 0, hd]) cylinder(h=h3h, d=d3h);
    }
    
    rotate(240) {
    translate([rs, 0, 0])
    cylinder(30, dd/2, dd/2, center = true);
    translate([rs, 0, hd]) cylinder(h=h3h, d=d3h);
    }
    }

difference(){
klobouk();
srouby();
}

translate([0,0,hm-1])
cylinder(hs+1, ds/2, ds/2);
