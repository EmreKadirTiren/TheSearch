//Set booster time
if (boost_active) {
    boost_time -= delta_time / 1000000;

    if (boost_time <= 0) {
        boost_active = false;
        boost_multiplier = 1;
    }
}


var pad  = 0;
var dead = 0.2;

var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
var my = keyboard_check(vk_down)  - keyboard_check(vk_up);

//checks gamemap
if (gamepad_is_connected(pad)) {
    var gx = gamepad_axis_value(pad, gp_axislh);
    var gy = gamepad_axis_value(pad, gp_axislv);

    if (abs(gx) > dead) mx = gx;
    if (abs(gy) > dead) my = gy;
}


// movemenent when boosts
hsp = (hsp + mx * accel * boost_multiplier) * drag;
vsp = (vsp + my * accel * boost_multiplier) * drag;

hsp = clamp(hsp, -max_speed * boost_multiplier, max_speed * boost_multiplier);
vsp = clamp(vsp, -max_speed * boost_multiplier, max_speed * boost_multiplier);


//sets collision with object wall on x
x += hsp;
if (place_meeting(x, y, oWall)) {
    while (place_meeting(x, y, oWall)) {
        x -= sign(hsp);
    }
    hsp = 0;
}

//sets collision with object wall on x
y += vsp;
if (place_meeting(x, y, oWall)) {
    while (place_meeting(x, y, oWall)) {
        y -= sign(vsp);
    }
    vsp = 0;
}


//flip oPlayer 
if (hsp > 0) image_xscale = 1;
else if (hsp < 0) image_xscale = -1;


//set room borders
var left   = 48;
var top    = -12;
var right  = 1376;
var bottom = 775;

x = clamp(x, left,  right  - sprite_width);
y = clamp(y, top,   bottom - sprite_height);


//set var moving
var moving = (abs(hsp) > 0.1) || (abs(vsp) > 0.1);

//if not move after certain time swish
if (!moving) {
    idle_time += delta_time / 1000000;
} else {
    idle_time = 0;
    is_bouncing = false;
}

if (idle_time > 2) {
    is_bouncing = true;
}

if (is_bouncing) {
    bounce_y = sin(current_time / 200) * 5;  // grote bounce
    bounce_x = sin(current_time / 300) * 2;  // swish
} else {
    bounce_y = 0;
    bounce_x = 0;
}

// Schieten met SPACE
if (keyboard_check_pressed(vk_space)) {
    var b = instance_create_layer(x, y, "Instances", oBullet);
    b.image_angle = image_angle;
}

if hp == 0 then room_goto(Death)
