//// Testovací destička
$fn=100;
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

tlpod = 2; //tloušťka podstavy

// Podpěrný kruh s příčkami
vzd = 24;    // Vzdálenost středů obou hlavních kruhů
dpvne = 74;  // Vnější průměr podpěrného kruhu
vzdsroub = 31;   //  Vzdálenost šroubů od středu podpěrného kruhu
dsroub = 5.4;   // Průměr díry na šroub

// Šrouby k motoru
dsm = 5.3;  // Průměr šroubů od motoru
dhm = 9;
rozm = 47.14; // Rozteč šroubů u motoru

dtest = 19; // Průměr kolečka na otestování polohy osy

difference() {
  // Podstava
    union() {
        cylinder(tlpod, ddvne/2, ddvne/2);
        translate([0, -vzd, 0]) cylinder(tlpod, dpvne/2, dpvne/2);
        }
        
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
       
       // Díra na osu
       cylinder(20, dtest/2, dtest/2);
       
       
       }
        