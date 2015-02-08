//Variables
size = 300;		//Table Size
levelHoleRadius = 1.5; //3mm / M3
coverHoleRadius = 1.5; //3mm / M3
coverHoleExtensionFactor = 2;
screwOffset = 15;
screwDistance = size /2 - screwOffset;

//Modules
module top() {
	difference() {
		table();
		level_holes(radius=levelHoleRadius);
		cover_holes(radius=levelHoleRadius);
	}
}

module base() {
	difference() {
		table();
		level_holes(radius=levelHoleRadius);
	}
}

module cover() {
	difference() {
		table();
		cover_holes(radius=coverHoleRadius*coverHoleExtensionFactor);
	}
}

//Render
linear_extrude(height=5)base();
translate([0,0,20])linear_extrude(height=5)top()
!translate([0,0,40])linear_extrude(height=5)cover();

//Helper Modules
module level_holes(radius) {
	translate([screwDistance,0])circle(r=radius);
	translate([-screwDistance,-screwDistance])circle(r=radius);
	translate([-screwDistance,screwDistance])circle(r=radius);
}

module cover_holes(radius) {
	rotate(a=[0,0,180])level_holes(radius=radius);
}

module table() {
		square(size,center=true);
}