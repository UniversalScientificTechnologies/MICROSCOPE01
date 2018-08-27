$fn=100;
//// Díl k upevnění motoru k mikroskopu pro ovládání osy Y

/// Parametry


TLS = 2;   // Tloušťka stěn válce

// U mikroskopu
DMi = 49;   // Vnější průměr válce pro připevnění k mikroskopu
HMiPod = 3;  // Tloušťka podstavy u mikroskopu
DMiVni = 29;  //  Vnitřní průměr disku pro uchycení k mikroskopu
rozmi = 27;  // Rozteč šroubů u mikroskopu
dsmi = 3.5;  // Průměr šroubů od mikroskopu

// U motoru
DMo = 78;  // Průměr disku pro uchycení motoru
HMoPod = 4;  // Tloušťka disku u motoru
// Šrouby k motoru
dsm = 5.5;  // Průměr šroubů od motoru
dhm = 9;
rozm = 47.14; // Rozteč šroubů u motoru

HC = 46 + HMiPod;      // Celková výška dílu


module teleso(){
    difference(){
        union(){
            cylinder(h=HC, d=DMi);
            cylinder(h=HMoPod, d=DMo);
        }
        cylinder(h=HC-HMiPod, r=DMi/2-TLS);
    }
}


// Díry

difference(){
teleso();
    
    translate([0,0,HC-HMiPod+0.3])
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
    translate([rozmi/2, rozmi/2, HC-HMiPod+0.3])
        cylinder(10, dsmi/2, dsmi/2);
    
    rotate(90) translate([rozmi/2, rozmi/2, HC-HMiPod+0.3])
        cylinder(10, dsmi/2, dsmi/2);
        
    rotate(180) translate([rozmi/2, rozmi/2, HC-HMiPod+0.3])
        cylinder(10, dsmi/2, dsmi/2);
    
    rotate(270) translate([rozmi/2, rozmi/2, HC-HMiPod+0.3])
        cylinder(10, dsmi/2, dsmi/2);
        
  // Díra na přístup ke spojce
    translate([50,0,HC/4]){hull(){
            rotate([0,-90,0]) cylinder(h=100, d=12);
            translate([0,0,HC/2]) rotate([0,-90,0]) cylinder(h=100, d=12);
    }}
    
}