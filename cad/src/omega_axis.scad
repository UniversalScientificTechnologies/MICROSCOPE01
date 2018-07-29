$fn=100;
//// Díl k upevnění motoru k mikroskopu pro ovládání osy X
lay = 0.2; // sila vrstvy
/// Parametry
h = 25;      // Výška válce spojky
d = 20;      // Vnější průměr spojky
hmd = 13-5; // mezera pod spojou (u mikroskopu)
hmu = 5; // mezera nad spojou (u motoru)

  // U motoru
  m = 42.3;      // Strana čtverce u motoru
  md = 55;
  hm = 4.5;      // Výška čtverce u motoru

  rm = 31;      //Rozteč děr na šrouby u motoru
  d1m = 3.4;     //Průměr děr na šrouby k motoru
  d2m = 8;    // Průměr otvoru na hřídel motoru
  d3m = 6.4;     //Průměr děr na hlavy šroubu k motoru
  

  // Příčky
  sp1 = 6;      //Šířka příček ve směru od středu
  sp2 = rm - 14; //Šířka příček kolmo na radiální směr
  
  // Upevnění k mikroskopu
  d1u = 74;    // Vnější průměr
  d2u = d + 6; // Vnitřní průměr
  hu = 4;      // Výška kotouče pro upevnění
  
  d3u = 6;      // Díry na šrouby
  d3h = 10;      // Díry hlavy šroubu
  h3h = 20;      // delka prostoru pro hlavu sroubu
  ru = 31;      // Vzdálenost děr na šrouby od středu
  
  
hc = hmd + h + hmu + hm;     // Celková výška objektu

/// Spodní destička - u motoru



module spojka(){
   difference(){
    cylinder(h=h, d=d);
    cylinder(h=h, d=8);
   }
}




module teleso(){
    difference(){
        union(){
            cylinder(h=hu, d=d1u);
            cylinder(h=hc, d=md);
        }
        cylinder(h=hc-hm, d=md-3*2);
    }
}





module srouby(){
 
      //Díry na šrouby k mikroskopu
      rotate(0){
        translate([ru, 0, 0]) cylinder(h=hu+2, d=d3u);
        translate([ru, 0, hu]) cylinder(h=h3h, d=d3h);
      }
      rotate(120){
        translate([ru, 0, 0]) cylinder(h=hu+2, d=d3u);
        translate([ru, 0, hu]) cylinder(h=h3h, d=d3h);
      }
      rotate(240){
        translate([ru, 0, 0]) cylinder(h=hu+2, d=d3u);
        translate([ru, 0, hu]) cylinder(h=h3h, d=d3h);
      }
      
      
      //Díry na šrouby k motoru
      translate([rm/2, rm/2, 0]){
        translate([0, 0, hmd+h+hmu+lay]) cylinder(h=hm+2, d=d1m);
        translate([0, 0, 0]) cylinder(h=hmd+h+hmu, d=d3m);
      }
      translate([rm/2, -rm/2, 0]){
        translate([0, 0, hmd+h+hmu+lay]) cylinder(h=hm+2, d=d1m);
        translate([0, 0, 0]) cylinder(h=hmd+h+hmu, d=d3m);
      }
      translate([-rm/2, rm/2, 0]){
        translate([0, 0, hmd+h+hmu+lay]) cylinder(h=hm+2, d=d1m);
        translate([0, 0, 0]) cylinder(h=hmd+h+hmu, d=d3m);
      }
      translate([-rm/2, -rm/2, 0]){
        translate([0, 0, hmd+h+hmu+lay]) cylinder(h=hm+2, d=d1m);
        translate([0, 0, 0]) cylinder(h=hmd+h+hmu, d=d3m);
      }
      
      translate([0, 0, hmd+h+hmu+lay]) cylinder(h=hm+2, d=d2m);
      translate([0, 0, hmd+h+hmu+hm-2]) cylinder(h=hm+2, d=25);
}


difference(){union(){

difference(){
    teleso();
    srouby();
    translate([0,0,10]){hull(){
            rotate([90,0,0]) cylinder(h=50, d=5);
            translate([0,0,h-5]) rotate([90,0,0]) cylinder(h=50, d=5);
    }}

}
//translate([0,0,hmd]) spojka();
}
cube(50);
}