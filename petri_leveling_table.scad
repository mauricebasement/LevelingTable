//Variables
dist = 110;
dist_a = 117;
size = 250;
petri = 97;

//Modules
module top() {
	difference() {
		square(size,center=true);
		for(i=[0:3])rotate(a=[0,0,90*i])translate([60,60])circle(r=petri/2);
		holes();
		cover_holes();
		level_holes();
	}
}

module middle() {
	difference() {
		base();
		holes();
		level_holes();
		cover_holes();
	}
}

module ground() {
	difference() {
		base();
		level_holes();
	}
}

module dust_cover() {
	difference() {
		base();
		cover_holes(ra=2.5);
	}
}

//Render
linear_extrude(height=5)ground();
translate([0,0,20])linear_extrude(height=5)middle()
translate([0,0,40])linear_extrude(height=5)top();
translate([0,0,60])linear_extrude(height=5)dust_cover();

//Helper Modules
module level_holes(ra=1.5) {
	translate([dist,0])circle(r=ra);
	translate([-dist,-dist])circle(r=ra);
	translate([-dist,dist])circle(r=ra);
}

module cover_holes(ra=1.5) {
	rotate(a=[0,0,180])level_holes(ra=ra);
}

module holes() {
		for(i=[0:3])rotate(a=[0,0,90*i])translate([dist_a,dist_a])circle(r=3/2);
}

module base() {
		square(size,center=true);
}