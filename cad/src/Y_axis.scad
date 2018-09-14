$fn=100;
//// Díl k upevnění motoru k mikroskopu pro ovládání osy Y

/// Parametry


TLS = 3;   // Tloušťka stěn válce

// U mikroskopu
DMi = 49;   // Vnější průměr válce pro připevnění k mikroskopu
HMiPod = 3;  // Tloušťka podstavy u mikroskopu
DMiVni = 29;  //  Vnitřní průměr disku pro uchycení k mikroskopu
rozmi1 = 27.73;  // Rozteč šroubů u mikroskopu v jednom směru
rozmi2 = 27.48;  // Rozteč šroubů u mikroskopu v druhém směru
dsmi = 3.5;  // Průměr šroubů od mikroskopu

// U motoru
DMo = 56.7;  // Délka strany čtverce pro uchycení motoru
HMoPod = 4;  // Tloušťka disku u motoru
// Šrouby k motoru
dsm = 5.5;  // Průměr šroubů od motoru
dhm = 9;
rozm = 47.14; // Rozteč šroubů u motoru

HTun = 10; // Délka tunelu na hlavy šroubů unvitř dílu
RTun = 3.5;  // Poloměr tunelu na hlavy šroubů unvitř dílu

HC = 46 + HMiPod + 36;      // Celková výška dílu


module teleso(){
    difference(){
        union(){
            cylinder(h=HC, d=DMi);
            translate([0,0,HMoPod/2])cube([DMo,DMo,HMoPod], center = true); // cylinder(h=HMoPod, d=DMo);
        }
        cylinder(h=HC-HMiPod, r=DMi/2-TLS);
    }
}


// Díry

difference(){
teleso();
    
    translate([0,0,HC-HMiPod+0.2])
    cylinder(h = HMiPod +1, r = DMiVni/2);
    
  // Otvory na šroubky motoru 
    translate([rozm/2, rozm/2, 0])
        cylinder(10, dsm/2, dsm/2);
    translate([rozm/2, rozm/2, HMoPod-1])
        cylinder(30, dhm/2, dhm/2);
    
    translate([rozm/2, -rozm/2, 0])
        cylinder(10, dsm/2, dsm/2);
    translate([rozm/2, -rozm/2, HMoPod-1])
        cylinder(30, dhm/2, dhm/2);
       
    translate([-rozm/2, rozm/2, 0])
        cylinder(10, dsm/2, dsm/2);
    translate([-rozm/2, rozm/2, HMoPod-1])
        cylinder(30, dhm/2, dhm/2);
       
    translate([-rozm/2, -rozm/2, 0])
        cylinder(10, dsm/2, dsm/2);
    translate([-rozm/2, -rozm/2, HMoPod-1])
        cylinder(30, dhm/2, dhm/2);
    
 // Otvory na šroubky k mikroskopu
    translate([rozmi1/2, rozmi2/2, HC-HMiPod+0.2])
        cylinder(10, dsmi/2, dsmi/2);
      translate([rozmi1/2, rozmi2/2, HC-HMiPod-HTun])
        cylinder(HTun, RTun, RTun);
        
    rotate(90) {translate([rozmi2/2, rozmi1/2, HC-HMiPod+0.2])
        cylinder(10, dsmi/2, dsmi/2);
        translate([rozmi2/2, rozmi1/2, HC-HMiPod-HTun])
        cylinder(HTun, RTun, RTun);}
        
    rotate(180) {translate([rozmi1/2, rozmi2/2, HC-HMiPod+0.2])
        cylinder(10, dsmi/2, dsmi/2);
        translate([rozmi1/2, rozmi2/2, HC-HMiPod-HTun])
        cylinder(HTun, RTun, RTun);}
    
    rotate(270) {translate([rozmi2/2, rozmi1/2, HC-HMiPod+0.2])
        cylinder(10, dsmi/2, dsmi/2);
        translate([rozmi2/2, rozmi1/2, HC-HMiPod-HTun])
        cylinder(HTun, RTun, RTun);}
        
  // Díra na přístup ke spojce
    translate([50,0,HC/8]){hull(){
            rotate([0,-90,0]) cylinder(h=100, d=12);
            translate([0,0,5*HC/8]) rotate([0,-90,0]) cylinder(h=100, d=12);
    }}
    
  // Otvory na připevnění drátů
    translate([0,10+DMi/2,HC-12]){
        difference(){
        cylinder(6,13.2,13.2);
        
            cylinder(6,11.2,11.2);
        }}
        
        translate([0,10+DMi/2,HC/4]){
        difference(){
        cylinder(6,13.2,13.2);
        
            cylinder(6,11.2,11.2);
        }}
    
}