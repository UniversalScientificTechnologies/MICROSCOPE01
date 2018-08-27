$fn=100;
//// Díl k upevnění motoru k mikroskopu pro ovládání osy Y

/// Parametry


TLS = 2;   // Tloušťka stěn válce

// U mikroskopu
DMi = 49;   // Vnější průměr válce pro připevnění k mikroskopu
HMiPod = 3;  // Tloušťka podstavy u mikroskopu
DMiVni = 29;  //  Vnitřní průměr podstavy pro uchycení k mikroskopu

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
    
    translate([0,0,HC-HMiPod])
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
    
}