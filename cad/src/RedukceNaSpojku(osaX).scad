//// Redukce ke spojce
$fn=100;

/// Parametry

//V mikroskopu
dv = 13; // Vnější průměr trubky
dd = 9.2; // Vnitrřní průměr trubky (průměr díry)
hm = 30 - 13; //Výška válce do mikroskopu


// Do spojky
ds = 8; // Průměr konce ve spojce
hs = 15; // Délka osy do spojky


difference() {
cylinder(hm, dv/2, dv/2);

translate([0,0,-3])
cylinder(hm, dd/2, dd/2);


}

translate([0,0,hm-1])
cylinder(hs+1, ds/2, ds/2);
