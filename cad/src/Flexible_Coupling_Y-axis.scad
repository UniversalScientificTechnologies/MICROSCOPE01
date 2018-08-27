// ********** CHANGE THESE PARAMETERS TO ADAPT DIMENSIONS ********** //
// modified by rdklein to use two different inner diameters

// OUTER DIAMETER
D1 = 23;

// INNER DIAMETER 1
D2 = 8.5;

// INNER DIAMETER 2
D2B = 0;

// TOTAL HEIGHT
H1 = 32;

// BASE HEIGHT
H2 = 8;

// Výška druhé (užší) podstavy
HB2 = 1.5;

// NUMBER OF FLEXIBLE ELEMENTS
n = 6;

// Thickness of springs
N  = 9.4;

// SCREW HOLE DIAMETER
D3 = 3.5;

// NUT HOLE DIAMETER
Dnut=7.2;

// NUT HOLE THICKNESS
Hnut=3.4;

// FLAT SHAFT THICKNESS
B=8.5;

// SCREW HOLE DISTANCE
H3=4;

// SPRINGS RESOLUTION
SLICES=25; //[6:36]

// ********** DON'T CHANGE BELOW UNLESS YOU KNOW WHAT TO DO ********** //

Re = D1/2;	// outer radius
Ri = D2/2;	// inner radius 1
Ri2 = D2B/2;	// inner radius 2
fn = 4*N;	// default face number for cylinders
R3 = D3/2;	// screw hole radius
Rnut=Dnut/2;	// nut hole radius
B2 = B-Ri;	// flat face distance from center
Hspring=H1-H2-HB2;

module sq_spring(in_R,out_R,height,rot) {
	width=out_R-in_R;
	linear_extrude(height = height, center = false, convexity = 50, twist = rot, slices = SLICES)
	polygon(points=[[in_R,0],
			[out_R,0],
			[out_R*cos(180/N),out_R*sin(180/N)],
			[in_R*cos(180/N),in_R*sin(180/N)]],
			paths=[[0,1,2,3]]);
}

module hole_h(HoleDist) {
	rotate([0,90,0]) {
		translate ([-HoleDist,0,(Re+B2)/2]) cylinder(r=R3,h=Re*1.2,center=true,$fn=fn);
		translate([-HoleDist,0,(Re+B2)/2]) cylinder(r=Rnut,h=Hnut,center=true,$fn=6);
		translate([0,0,(Re+B2)/2]) cube(size=[2*HoleDist,2*Rnut*cos(30),Hnut],center=true);
	}
}


$fn=fn;
module body1() {
	difference() {
		union() {
			difference(){
				cylinder (r=Re,h=H2,center=false, $fn=fn);
				cylinder(r=Ri,h=H2,center=false, $fn=fn);
				}
			translate([B2,-Ri,0]) cube(size=[Ri,2*Ri,H2], center=false);
		}
		hole_h(H3);
	}
}
module body2() {
	difference() {
		union() {
			difference(){
				cylinder (r=Re,h=HB2,center=false, $fn=fn);
				cylinder(r=Ri2,h=HB2,center=false, $fn=fn);
				}
			translate([B2,-Ri2,0]) cube(size=[Ri2,2*Ri2,H2], center=false);
		}
		
	}
}





// Parametry připevnění k mikroskopu
vzd = 5;  // Vzdálenost dírek na šroubek od středu
Rsroubek = 1.45; // Poloměr díry na šroubek

Dvalec = 17.6;   // Poloměr vnitřní díry na hřídel v mikroskopu (se šroubky)
Hvalec = 25;  // Výška válce na hřídel v mikroskopu

Rvalec = Dvalec/2;


difference() {
    union() {


body1();
translate([0,0,H1]) rotate([0,180,0]) body2();
for (i=[1:n]){
	rotate([0,0,360*i/n]) translate ([0,0,H2]) sq_spring(Re-3.5,Re,Hspring,120);
}
// Válec u mikroskopu
translate([0,0,H1]) cylinder(r = Re, h = Hvalec, center = false);
}
// Vnitřní strana dutého válce u mikroskopu
translate([0,0, H1]) cylinder(r = Rvalec, h = Hvalec+1, center = false);

// Dírky na šroubky
translate([0,vzd, H1-HB2+0.3]) cylinder(r = Rsroubek, h = 6, center = false);
rotate(120) translate([0,vzd, H1-HB2+0.3]) cylinder(r = Rsroubek, h = 6, center = false);
rotate(240) translate([0,vzd, H1-HB2+0.3]) cylinder(r = Rsroubek, h = 6, center = false);

}







/* //V mikroskopu
dv = 13; // Vnější průměr trubky
dd = 9; // Vnitrřní průměr trubky (průměr díry)
hm = 20; //Výška válce do mikroskopu

// Zářez na čudlík
zs = 2.2;  // Šířka zářezu
zh = 5;  // Hloubka zářezu


translate([0, 0, H1])
difference() {
cylinder(hm, dv/2, dv/2);

translate([0,0, 1])
cylinder(hm, dd/2, dd/2);

translate([0,dd/2,hm])
cube([zs,6,zh], center = true);
}