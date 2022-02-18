// don't change these
switch_x = 14;
switch_y = switch_x;
pitch = 19;
u = pitch;
//clip_thickness = 1.524; //mx
clip_thickness = 1.5; //gateron
clip_length = 2;

// change this for the layer height you want to print at (0.2 or 0.16 recommended)
layer_height = 0.2;

//plate size
plate_thickness = 3;//currently only 3mm is supported
rows = 6;
cols = 8;
outer_padding = 5.5;
rounding = 2;
hole_size = 4; // must be less that outer_padding

switch_positions = [
                    //row1
                    [0,-1*u,0],
                    [0,0,0],
                    [0,1*u,0],
                    [0,2*u,0],
                    [0,3*u,0],
                    [0,4*u,0],
                    [0,5*u,0],
                    //row2
                    [1*u,-1.25*u,0],
                    [1*u,0,0],
                    [1*u,1*u,0],
                    [1*u,2*u,0],
                    [1*u,3*u,0],
                    [1*u,4*u,0],
                    [1*u,5*u,0],

                    //row3
                    [2*u,-1.25*u,0],
                    [2*u,0,0],
                    [2*u,1*u,0],
                    [2*u,2*u,0],
                    [2*u,3*u,0],
                    [2*u,4*u,0],
                    [2*u,5*u,0],

                    //row4
                    [3*u,0,0],
                    [3*u,1*u,0],
                    [3*u,2*u,0],
                    [3*u,3*u,0],
                    [3*u,4*u,0],
                    [3*u,5*u,0],

                    //row5
                    [4*u,0,0],
                    [4*u,1*u,0],
                    [4*u,2*u,0],
                    [4*u,3*u,0],
                    //2u stab key rotated
                    [4*u,5*u,0],

                    //row5
                    [5*u,3*u,0],
                    //2u stab key rotated
                    [5*u,5*u,0],
                    ];

2u_stabilised_switch_positions = [
                    [3*u,-1.5*u,0],
                    [4*u,-1.5*u,0],
                    ];
//functions
module switch_hole(position){
    translate(position)
    translate([0,0,(plate_thickness-clip_thickness)/2])
    union(){
        //clip
        cube([switch_x+clip_length, switch_y+clip_length, plate_thickness-clip_thickness],center=true);
        //rim
        translate([0,0,plate_thickness-clip_thickness])cube([switch_x, switch_y, clip_thickness],center=true);
    }
}

module 2u_stabilised_key_hole(position){
    clip_points = [
        [-0.50,32.2/2],
        [2.3,32.2/2],
        [2.3,30.45/2],
        [5.53,30.45/2],
        [5.53,17.15/2],
        [4.73,17.15/2],
        [4.73,14/2],
        [7,14/2],
        [7,0],

        [-7,0],
        [-7,14/2],
        [-5.97,14/2],
        [-5.97,17.15/2],
        [-6.77,17.15/2],
        [-6.77,20.80/2],
        [-7.97,20.80/2],
        [-7.97,26.80/2],
        [-6.77,26.80/2],
        [-6.77,30.45/2],
        [-0.5,30.45/2]
    ];

    translate(position)
    union(){
        //clip
        translate([0,0,plate_thickness-(clip_thickness/2)])
        linear_extrude(clip_thickness,center=true)
        union(){
            rotate([180,0,0])polygon(clip_points);
            polygon(clip_points);
        }

        //rim
        translate([0,0,(plate_thickness-clip_thickness)/2])
        linear_extrude(plate_thickness-clip_thickness,center=true)
        union(){
            rotate([180,0,0])offset(delta=clip_length+layer_height){polygon(clip_points);}
            offset(delta=clip_length+layer_height){polygon(clip_points);}
        }
    }
}

module plate_gen(){
    points = [
        [.5*u-outer_padding,.5*u-outer_padding,0],
        [.5*u-outer_padding,(cols+.5)*u+outer_padding,0],
        [(rows+.5)*u+outer_padding,(cols+.5)*u+outer_padding,0],
        [(rows+.5)*u+outer_padding,.5*u-outer_padding,0],
        ];
    holes = [
        [.5*u-outer_padding/2,.5*u-outer_padding/2,0],
        [.5*u-outer_padding/2,(cols+.5)*u+outer_padding/2,0],
        [(rows+.5)*u+outer_padding/2,(cols+.5)*u+outer_padding/2,0],
        [(rows+.5)*u+outer_padding/2,.5*u-outer_padding/2,0],
        ];
    difference(){
        hull(){
        for(i=points){
            translate(i)cylinder(r1=rounding, r2=rounding, h=plate_thickness, $fn=16);
        }
        }
        union(){
            for(i=holes){
                translate(i)cylinder(r1=hole_size/2, r2=hole_size/2, h=plate_thickness*4, $fn=16, center=true);
            }
        }
    }
}

// actually generating the plate


//minkowski(){ // uncomment for rounded edges
difference(){
    //plate
    translate([-1*u,-3*u,0])plate_gen();
    
    // cutouts for switches and stabs
    union(){
        //stabs from position list
        for(i=2u_stabilised_switch_positions){
            2u_stabilised_key_hole(i);
        }
        
        //custom positioned (rotated) stabs
        translate([.5*u,7.5*u,0])rotate([180,180,90])
        2u_stabilised_key_hole([3.5*u,4*u,0]);

        for(i=switch_positions){
            switch_hole(i);
        }
    }
}
//sphere(2*layer_height,$fn=32); // uncomment for rounded edges
//} // uncomment for rounded edges