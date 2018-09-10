$fn=100;
//// Díl k upevnění motoru k mikroskopu pro ovládání rotace talíře

/// Parametry


TLS = 2;   // Tloušťka stěn válce

// U mikroskopu
DMi = 40;   // Vnější průměr válce pro připevnění k mikroskopu
HMiPod = 3;  // Tloušťka podstavy u mikroskopu
DMiVni = 15;  //  Vnitřní průměr disku pro uchycení k mikroskopu
rozmi = 10.7;  // Rozteč šroubů u mikroskopu
dsmi = 3.5;  // Průměr šroubů od mikroskopu



DMo = 40;  // Průměr disku pro uchycení motoru
HMoPod = 4;  // Tloušťka disku u motoru
// Šrouby k motoru
dsm = 3.4;  // Průměr šroubů od motoru
dhm = 6.4;  //Průměr děr na hlavy šroubu k motoru
rozm = 31; // Rozteč šroubů u motoru


h = 25;      // Výška válce spojky
hmd = 13-5; // mezera pod spojou (u mikroskopu)
hmu = 5; // mezera nad spojou (u motoru)

HC = h + hmd + hmu + HMiPod + 6;      // Celková výška dílu


module teleso(){
    difference(){
        union(){
            cylinder(h=HC, d=DMi);
            cylinder(h=HMoPod, d=DMo);
            translate([0,0,HMoPod/2]) cube([DMo, DMo, HMoPod], center = true);
        }
        translate([0,0,HMoPod])
        cylinder(h=HC-HMiPod-HMoPod, r=DMi/2-TLS);
        
        cylinder(h = HMoPod+1, r = DMi/2-TLS);
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
        cylinder(20, dhm/2, dhm/2);
    
    translate([rozm/2, -rozm/2, 0])
        cylinder(10, dsm/2, dsm/2);
    translate([rozm/2, -rozm/2, HMoPod-1])
        cylinder(20, dhm/2, dhm/2);
       
    translate([-rozm/2, rozm/2, 0])
        cylinder(10, dsm/2, dsm/2);
    translate([-rozm/2, rozm/2, HMoPod-1])
        cylinder(20, dhm/2, dhm/2);
       
    translate([-rozm/2, -rozm/2, 0])
        cylinder(10, dsm/2, dsm/2);
    translate([-rozm/2, -rozm/2, HMoPod-1])
        cylinder(20, dhm/2, dhm/2);
    
 // Otvory na šroubky k mikroskopu
    translate([rozmi, 0, HC-HMiPod+0.2])
        cylinder(10, dsmi/2, dsmi/2);
    
    rotate(120) translate([rozmi, 0, HC-HMiPod+0.2])
        cylinder(10, dsmi/2, dsmi/2);
        
    rotate(240) translate([rozmi, 0, HC-HMiPod+0.2])
        cylinder(10, dsmi/2, dsmi/2);
    
   
  // Díra na přístup ke spojce
    translate([50,0,HC/4-1]){hull(){
            rotate([0,-90,0]) cylinder(h=100, d=12);
            translate([0,0,HC/2]) rotate([0,-90,0]) cylinder(h=100, d=12);
    }}
    
  // Otvor na připevnění drátů
    translate([0,10+DMo/2,3*HC/4]){
        difference(){
        cylinder(4,13,13);
        
            cylinder(4,11.2,11.2);
        }
        }
    
}