$fn=100;
//// Díl k upevnění motoru k mikroskopu pro ovládání osy X

/// Parametry

// U otáčejícího se kola
h = 60;      // Celková výška dílu
ddvne = 78;      // Vnější průměr dolní kruhové části
ddvni = 73;    // Vnitřní průměr dolní kruhové části

hvni = 57;  // Výška vnitřního kuželu
dhvne = 78;      // Vnější průměr horní kruhové části
dhvni = 73;    // Vnitřní průměr horní kruhové části
tlt = h-hvni; // tloustka stropu
dkom = 38.5;  // Průměr kolečka odsazení motoru
hlod = 2;   // Hloubka odsazení

tlpod = 5; //tloušťka podstavy

// Podpěrný kruh s příčkami
vzd = 24;    // Vzdálenost středů obou hlavních kruhů
dpvne = 74;  // Vnější průměr podpěrného kruhu
vzdsroub = 31;   //  Vzdálenost šroubů od středu podpěrného kruhu
dsroub = 5.4;   // Průměr díry na šroub

// Šrouby k motoru
dsm = 5.3;  // Průměr šroubů od motoru
dhm = 9;
rozm = 47.14; // Rozteč šroubů u motoru



difference() {
   union() {
  // Podstava
    union() {
        cylinder(tlpod, ddvne/2, ddvne/2);
        translate([0, -vzd, 0]) cylinder(tlpod, dpvne/2, dpvne/2);
        }

  // Hlavní kužel
    translate([0,0,0]) cylinder(h, ddvne/2, dhvne/2);
        
  // Příčky
 intersection() {
    union() {
     rotate(28)
    translate([-3, -vzd-dpvne/2+0.1, 0])
        cube([6, dpvne/2-ddvne/2+vzd, h]);
 
     rotate(9)
    translate([-3, -vzd-dpvne/2+0.1, 0])
        cube([6, dpvne/2-ddvne/2+vzd, h]);
     
     rotate(-9)
    translate([-3, -vzd-dpvne/2+0.1, 0])
        cube([6, dpvne/2-ddvne/2+vzd, h]);
  
     rotate(-28)
    translate([-3, -vzd-dpvne/2+0.1, 0])
        cube([6, dpvne/2-ddvne/2+vzd, h]);    
   }
   hull() {
       union() {
        cylinder(tlpod, ddvne/2, ddvne/2);
        translate([0, -vzd, 0]) cylinder(tlpod, dpvne/2, dpvne/2);
        }
    translate([0,0,0]) cylinder(h, ddvne/2, dhvne/2);}
}   
  }    
  // Vnitřní kužel
   cylinder(hvni, ddvni/2, dhvni/2);
  
  // Otvory na spodní šrouby
   translate([0, -vzd, 0,]) {
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(32.5)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(65)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(-32.5)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(-65)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);       
       
       }
       
  // Rozšíření děr na podpěrné šrouby (nahoru)
       translate([0, -vzd+1.5, 0,]) {
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(32.5)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(65)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(-32.5)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(-65)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);       
       
       }
       
    // Rozšíření děr na podpěrné šrouby (dolů)
       translate([0, -vzd-1.5, 0,]) {
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(32.5)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(65)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(-32.5)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);
       
       rotate(-65)
       translate([0, -vzdsroub, 0]) 
        cylinder(20, dsroub/2, dsroub/2, center = true);       
       
       }
       
  // Otvory na motor 
    translate([rozm/2, rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
    translate([rozm/2, rozm/2, h-30-tlt])
        cylinder(30, dhm/2, dhm/2);
    
    translate([rozm/2, -rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
    translate([rozm/2, -rozm/2, h-30-tlt])
        cylinder(30, dhm/2, dhm/2);
       
    translate([-rozm/2, rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
    translate([-rozm/2, rozm/2, h-30-tlt])
        cylinder(30, dhm/2, dhm/2);
       
    translate([-rozm/2, -rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
    translate([-rozm/2, -rozm/2, h-30-tlt])
        cylinder(30, dhm/2, dhm/2);
       
  // Otvor na osu
    translate([0,0,h-2.8])
       cylinder(10, 5, 5);
       
  // Odsazení motoru kolem osy
    translate([0,0,h-hlod])
       cylinder(10, dkom/2, dkom/2);
       
  // Díra na přístup ke spojce
      translate([0,0,h/4]){hull(){
            rotate([0,-90,0]) cylinder(h=50, d=12);
            translate([0,0,h/2]) rotate([0,-90,0]) cylinder(h=50, d=12);
    }}
       
}    





