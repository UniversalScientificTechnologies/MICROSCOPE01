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

// Kruh se šrouby a podpěrami
vzd = 23;    // Vzdálenost středů obou hlavních kruhů
dpvne = 72;  // Vnější průměr podpěrného kruhu
vzdsroub = 31;   //  Vzdálenost šroubů od středu podpěrného kruhu
dsroub = 4.6;   // Průměr díry na šroub

// Šrouby k motoru
dsm = 5;  // Průměr šroubů od motoru
rozm = 47.14; // Rozteč šroubů u motoru



difference() {
   union() {
  // Podstava
    union() {
        cylinder(3, ddvne/2, ddvne/2);
        translate([0, -23, 0]) cylinder(3, dpvne/2, dpvne/2);
        }

  // Hlavní kužel
    translate([0,0,3]) cylinder(h-3, ddvne/2, dhvne/2);
        
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
        cylinder(3, ddvne/2, ddvne/2);
        translate([0, -23, 0]) cylinder(3, dpvne/2, dpvne/2);
        }
    translate([0,0,3]) cylinder(h-3, ddvne/2, dhvne/2);}
}   
  }    
  // Vnitřní kužel
   cylinder(hvni, ddvni/2, dhvni/2);
  
  // Otvory na spodní šrouby
   translate([0, -vzd, 0,]) {
       translate([0, -31, 0]) 
        cylinder(8, dsroub/2, dsroub/2, center = true);
       
       rotate(32.5)
       translate([0, -31, 0]) 
        cylinder(8, dsroub/2, dsroub/2, center = true);
       
       rotate(65)
       translate([0, -31, 0]) 
        cylinder(8, dsroub/2, dsroub/2, center = true);
       
       rotate(-32.5)
       translate([0, -31, 0]) 
        cylinder(8, dsroub/2, dsroub/2, center = true);
       
       rotate(-65)
       translate([0, -31, 0]) 
        cylinder(8, dsroub/2, dsroub/2, center = true);       
       
       }
       
  // Otvory na motor 
    translate([rozm/2, rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
    
    rotate(90)
    translate([rozm/2, rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
       
    rotate(180)
    translate([rozm/2, rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
       
    rotate(-90)
    translate([rozm/2, rozm/2, h-2.8])
        cylinder(10, dsm/2, dsm/2);
       
  // Otvor na osu
    translate([0,0,h-2.8])
       cylinder(10, 5, 5);
       
}    





