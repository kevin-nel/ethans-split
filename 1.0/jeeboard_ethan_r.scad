slop = 0.0;
switch_x = 14 + slop;
switch_y = switch_x;
rounding = 2;

plate_thickness = 3;

//clip_thickness = 1.524 + slop; //mx
clip_thickness = 1.5 + slop; //gateron

outer_padding = 5;
hole_size = 4;

case_height=12;

pitch = 19;
u = pitch;

switch_positions = [
                    //row1
                    [0,0,0],
                    [0,1*u,0],
                    [0,2*u,0],
                    [0,3*u,0],
                    [0,4*u,0],
                    //stab

                    //row2
                    [1*u,0,0],
                    [1*u,1*u,0],
                    [1*u,2*u,0],
                    [1*u,3*u,0],
                    [1*u,4*u,0],
                    [1*u,5*u,0],
                    [1*u,6*u,0],

                    //row3
                    [2*u,0,0],
                    [2*u,1*u,0],
                    [2*u,2*u,0],
                    [2*u,3*u,0],
                    [2*u,4*u,0],
                    [2*u,5*u,0],
                    [2*u,6*u,0],

                    //row4
                    [3*u,0,0],
                    [3*u,1*u,0],
                    [3*u,2*u,0],
                    [3*u,3*u,0],
                    [3*u,4*u,0],
                    [3*u,5*u,0],
                    [3*u,6*u,0],

                    //row5
                    [4*u,0,0],
                    [4*u,1*u,0],
                    [4*u,2*u,0],

                    //row6
                    [5*u,0,0],
                    [5*u,1*u,0],
                    [5*u,2*u,0],

                    ];

2u_stabilised_switch_positions = [
                    [0*u,5.5*u,0]
                    ];

module switch_hole(position){
    translate(position)
    translate([0,0,(plate_thickness-clip_thickness)/2])
    union(){
        //clip
        cube([switch_x+2, switch_y+2, plate_thickness-clip_thickness],center=true);
        //rim
        translate([0,0,plate_thickness-clip_thickness])cube([switch_x, switch_y, clip_thickness],center=true);
    }
}

module 2u_stabilised_key_hole(position){
    points = [
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
            rotate([180,0,0])polygon(points);
            polygon(points);
        }

        //rim
        translate([0,0,(plate_thickness-clip_thickness)/2])
        linear_extrude(plate_thickness-clip_thickness,center=true)
        union(){
            rotate([180,0,0])offset(delta=1){polygon(points);}
            offset(delta=1){polygon(points);}
        }
    }

}

module plate_gen(){
    points = [
        [-.5*u,-.5*u,0],
        [-.5*u,6.5*u,0],
        [5.5*u,6.5*u,0],
        [5.5*u,-.5*u,0],
        ];
    hull(){
    for(i=points){
        translate(i)cylinder(r1=rounding, r2=rounding, h=plate_thickness);
    }
    }
}
difference(){
    //plate
    plate_gen();
    // cutouts for switches and stabs
    union(){
        //stabs from position list
        for(i=2u_stabilised_switch_positions){
            2u_stabilised_key_hole(i);
        }

        for(i=switch_positions){
            switch_hole(i);
        }
    }
}
