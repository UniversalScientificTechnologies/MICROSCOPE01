//// Díl k upevnění motoru k mikroskopu pro ovládání osy X

/// Parametry
h = 25;      // Výška válce spojky
d = 20;      // Vnější průměr spojky

  // U motoru
  m = 42.3;      // Strana čtverce u motoru
  hm = 4;      // Výška čtverce u motoru

  rm = 31;      //Rozteč děr na šrouby u motoru
  d1m = 6;     //Průměr děr na šrouby k motoru

  d2m = 8;    // Průměr otvoru na hřídel motoru

  // Příčky
  sp1 = 6;      //Šířka příček ve směru od středu
  sp2 = rm - 14; //Šířka příček kolmo na radiální směr
  
  // Upevnění k mikroskopu
  d1u = 60;    // Vnější průměr
  d2u = d + 6; // Vnitřní průměr
  hu = 4;      // Výška kotouče pro upevnění
  
  d3u = 6;      // Díry na šrouby
  ru = 30;      // Rozteč děr na šrouby
  
  
hc = h+hm+hu;     // Celková výška objektu

/// Spodní destička - u motoru

difference(){
  //Základní destička
  intersection() {
    cube([m, m, hm], center=true);
    
    rotate(45)
    cube([m*2/sqrt(2)-5, m*2/sqrt(2)-5, hm+2], center=true);
  } 
  
  //Díry na šrouby
  translate([rm/2, rm/2, 0])
  cylinder(hm+2, d1m/2, d1m/2, center=true);
  
  translate([-rm/2, rm/2, 0])
  cylinder(hm+2, d1m/2, d1m/2, center=true);
  
  translate([-rm/2, -rm/2, 0])
  cylinder(hm+2, d1m/2, d1m/2, center=true);
  
  translate([rm/2, -rm/2, 0])
  cylinder(hm+2, d1m/2, d1m/2, center=true);
  
  // Prostřední díra
  cylinder(hm+2, d2m/2, d2m/2, center=true);
  
}


/// Příčky vedoucí k mikroskopu

translate([m/2-sp1/2, 0, hc/2])
cube([sp1,sp2,hc], center=true);

rotate(90)
translate([m/2-sp1/2, 0, hc/2])
cube([sp1,sp2,hc], center=true);

rotate(180)
translate([m/2-sp1/2, 0, hc/2])
cube([sp1,sp2,hc], center=true);

rotate(270)
translate([m/2-sp1/2, 0, hc/2])
cube([sp1,sp2,hc], center=true);


/// Upevnění k mikroskopu

translate([0,0,hc-hu/2])
difference() {
    cylinder(hu, d1u/2, d1u/2, center=true);
    
  cylinder(hu+2, d2u/2, d2u/2, center=true);
    
  //Díry na šrouby
  translate([ru/2, ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
  
  translate([-ru/2, ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
  
  translate([-ru/2, -ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
  
  translate([ru/2, -ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
    
}