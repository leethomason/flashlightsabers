$fn=80;

INCH_TO_MM = 25.4;

D_INNER = 25.6;
THICKNESS = 2.0;
D_OUTER = D_INNER + THICKNESS;

Z_LIGHT = 3.4 * INCH_TO_MM;
Z_BODY = Z_LIGHT + 1.0 * INCH_TO_MM;

M_BODY = 0;
M_EMITTER = Z_BODY + 40;

translate([0, 0, M_BODY]) {
	difference() {
		union() {
			cylinder(d=D_OUTER, h=Z_BODY);

			// Obi Wan pommel
			S0 = 10;
			S1 = 8;
			H = 2;
			N = 6;

			for(r=[0:(N-1)]) rotate([0, 0, r * 360/N])
			{
			
				hull() {
					translate([0, 0, S1/2]) rotate([-90, 0, 0]) {
						translate([-S1/2, -S1/2, 0])
							cube(size=[S1, S1, D_OUTER/2 + H]);
					}
					translate([0, 0, S0/2]) rotate([-90, 0, 0]) {
						translate([-S0/2, -S0/2, 0]) 
							cube(size=[S0, S0, D_OUTER/2 - 1]);
					}
				}
			}

			hull() {
				translate([0, 0, 50]) rotate([90, 0, 0])
					cylinder(h=(D_OUTER/2 + 1), d=15);
				translate([0, 0, 80]) rotate([90, 0, 0])
					cylinder(h=(D_OUTER/2 + 1), d=15);
			}

			translate([0, 0, 100]) rotate([90, 0, 90])
				cylinder(h=(D_OUTER/2 + 1), d=8);

		}
		cylinder(d=D_INNER, h=Z_BODY);
	}
}

translate([0, 0, M_EMITTER])
{
	Z_EMITTER = 25;
	D_OUT2 = D_OUTER + 4;
	RIDGE = 6;

	difference() {
		/*
		union() {
			cylinder(d=D_OUTER, h=Z_EMITTER);

			// Ridge emitter (Fisto, Unduli, etc.)
			union() {
				N = 3;
				STEP = (Z_EMITTER + (Z_EMITTER/N - RIDGE)) / N;

				for(r=[0:(N-1)]) {
					translate([0, 0, r*STEP]) hull() {
						cylinder(d=D_OUTER, h=RIDGE);
						translate([0, 0, RIDGE/2]) cylinder(d=D_OUT2, h=RIDGE/2);
					}
				}
			}
		}
		*/
		union() {
			difference() 
			{
				D = D_OUTER*2 + 2;
				OFFSET = 30;
				cylinder(d=D_OUTER, h=Z_EMITTER+30);
				translate([-20, D/4, 25+OFFSET]) rotate([0, 90, 0])
					cylinder(d=D, h=80);
			}
			hull() {
				translate([0, 0, 8]) rotate([-90, 0, 0])
					cylinder(h=(D_OUTER/2 + 1), d=5);
				translate([0, 0, 18]) rotate([-90, 0, 0])
					cylinder(h=(D_OUTER/2 + 1), d=10);
			}
			translate([0, 0, 8]) rotate([-90, 0, 0])
				cylinder(h=(D_OUTER/2 + 2), d=4);
			translate([0, 0, 18]) rotate([-90, 0, 0])
				cylinder(h=(D_OUTER/2 + 2), d=4);
		}
		cylinder(d=D_INNER, h=Z_EMITTER+100);
	}
}
