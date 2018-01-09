//// Díl k upevnění motoru k mikroskopu pro ovládání osy X

/// Parametry
h = 25;      // Výška válce spojky
d = 20;      // Vnější průměr spojky

  // U motoru
  m = 42.3;      // Strana čtverce u motoru
  hm = 4;      // Výška čtverce u motoru
  mo = 5;     // Oříznutí rohů

  rm = 31;      //Rozteč děr na šrouby u motoru
  d1m = 6;     //Průměr děr na šrouby k motoru

  d2m = 8;    // Průměr otvoru na hřídel motoru

  // Příčky
  sp1 = 6;      //Šířka příček ve směru od středu
  sp2 = rm - 14; //Šířka příček kolmo na radiální směr
  
  // Upevnění k mikroskopu
  d1u = 50;    // Vnější průměr
  d2u = d + 8; // Vnitřní průměr
  hu = 4;      // Výška kotouče pro upevnění
  ho = 19;     // Oříznutí rohů
  
  d3u = 6;      // Díry na šrouby
  ru = 30;      // Rozteč děr na šrouby
  
  
hc = h+hm+hu;     // Celková výška objektu
$fn=90;

difference() {
hull() {
/// Spodní destička - u motoru
  //Základní destička
  translate([0,0,hm/2]){
    intersection() {
   
    cube([m, m, hm], center=true);
    
    rotate(45)
    cube([m*2/sqrt(2)-mo, m*2/sqrt(2)-mo, hm+2], center=true);
    }
  }

/// Upevnění k mikroskopu
  translate([0,0,hc-hu/2])
  intersection() {
  cube([d1u, d1u, hu], center = true);
  
  rotate(45)
  cube([d1u*2/sqrt(2)-ho, d1u*2/sqrt(2)-ho, hu+2], center = true);
  //cylinder(hu, d1u/2, d1u/2, center=true); 
  }
}

/// Spodní destička - u motoru
  //Díry na šrouby
translate([0,0,hm/2]){
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
/// Upevnění k mikroskopu
  //Prostřední díra
  translate([0,0,hc/2+hm])
  cylinder(hc, d2u/2, d2u/2, center=true);
    
  //Díry na šrouby
  translate([0,0,hc-hu/2]){
  translate([ru/2, ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
  
  translate([-ru/2, ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
  
  translate([-ru/2, -ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
  
  translate([ru/2, -ru/2, 0])
  cylinder(hu+2, d3u/2, d3u/2, center=true);
  }
  
/// šroubovací díry
  translate([0,0,hm+h/2]){
  rotate(45)
  cube([100, rm-12, h], center = true);
  
  rotate(135)
  cube([100, rm-12, h], center = true);
  }


}