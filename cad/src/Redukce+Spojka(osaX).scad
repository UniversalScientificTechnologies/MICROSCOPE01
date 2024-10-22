// ********** CHANGE THESE PARAMETERS TO ADAPT DIMENSIONS ********** //
// modified by rdklein to use two different inner diameters

// OUTER DIAMETER
D1 = 25;

// INNER DIAMETER 1
D2 = 6.85;

// INNER DIAMETER 2
D2B = 0;

// TOTAL HEIGHT
H1 = 32;

// BASE HEIGHT
H2 = 8;

// NUMBER OF FLEXIBLE ELEMENTS
n = 6;

// Thickness of springs
N  = 9.4;

// SCREW HOLE DIAMETER
D3 = 3.5;

// NUT HOLE DIAMETER
Dnut=6.6;

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
fn = 100;	// default face number for cylinders
R3 = D3/2;	// screw hole radius
Rnut=Dnut/2;	// nut hole radius
B2 = B-Ri;	// flat face distance from center
Hspring=H1-H2-4;

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
				cylinder(r=Ri,h=H2-0.2,center=false, $fn=fn);
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
				cylinder (r=Re,h=4,center=false, $fn=fn);
				cylinder(r=Ri2,h=4,center=false, $fn=fn);
				}
			translate([B2,-Ri2,0]) cube(size=[Ri2,2*Ri2,H2], center=false);
		}
		
	}
}


//// Redukce ke spojce pro osu X

$fn=100;
/// Parametry

//U mikroskopu
dvd = 46.4; // Vnější průměr disku
hd = 3;  //Výška disku
dvv = 38;  // Vnější průměr válce
dvn = 35.4; // Vnitrřní průměr klobouku (průměr díry)
hm = 23; //Výška klobouku

// Díry na šrouby
rs = 20; // Vzdálenost děr na šrouby od středu
dd = 2.4; // Průměr dírky na šroub

d3h = 5;      // Díry hlavy šroubu
h3h = 20;      // delka prostoru pro hlavu sroubu


module klobouk(){
difference() {
    union() {
cylinder(hd, dvd/2, dvd/2);
cylinder(hm, dvv/2, dvv/2-6.5);      
    }
    
translate([0,0,0])
cylinder(hm-3.5, dvn/2, dvn/2-6.4);
}

}

module srouby(){
    
    translate([rs, 0, 0])
       cylinder(30, dd/2, dd/2, center = true);
    translate([rs, 0, hd-1.6]) cylinder(h=h3h, d=d3h);
     
    
    rotate(120) {
    translate([rs, 0, 0])
    cylinder(30, dd/2, dd/2, center = true);
    translate([rs, 0, hd-1.6]) cylinder(h=h3h, d=d3h);
    }
    
    rotate(240) {
    translate([rs, 0, 0])
    cylinder(30, dd/2, dd/2, center = true);
    translate([rs, 0, hd-1.6]) cylinder(h=h3h, d=d3h);
    }
    }

difference(){
klobouk();
srouby();
}

/// Spojka


rotate([0,180,0]){
translate([0,0,-hm-H1]){
body1();
translate([0,0,H1]) rotate([0,180,0]) body2();
for (i=[1:n]){
	rotate([0,0,360*i/n]) translate ([0,0,H2]) sq_spring(Ri+5.5,Re,Hspring,120);
}
}
}

