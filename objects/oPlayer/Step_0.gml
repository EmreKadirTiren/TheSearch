// ---------------------------------------------------------
//  BUBBLE SPEEDBOOST TIMER
// ---------------------------------------------------------
if (boost_active) {
    boost_time -= delta_time / 1000000;

    if (boost_time <= 0) {
        boost_active = false;
        boost_multiplier = 1;
    }
}


// ---------------------------------------------------------
//  INPUT (KEYBOARD + CONTROLLER)
// ---------------------------------------------------------
var pad  = 0;
var dead = 0.2;

var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
var my = keyboard_check(vk_down)  - keyboard_check(vk_up);

if (gamepad_is_connected(pad)) {
    var gx = gamepad_axis_value(pad, gp_axislh);
    var gy = gamepad_axis_value(pad, gp_axislv);

    if (abs(gx) > dead) mx = gx;
    if (abs(gy) > dead) my = gy;
}


// ---------------------------------------------------------
//  MOVEMENT (MET BOOST)
// ---------------------------------------------------------
hsp = (hsp + mx * accel * boost_multiplier) * drag;
vsp = (vsp + my * accel * boost_multiplier) * drag;

hsp = clamp(hsp, -max_speed * boost_multiplier, max_speed * boost_multiplier);
vsp = clamp(vsp, -max_speed * boost_multiplier, max_speed * boost_multiplier);


// ---------------------------------------------------------
//  COLLISION X
// ---------------------------------------------------------
x += hsp;
if (place_meeting(x, y, oWall)) {
    while (place_meeting(x, y, oWall)) {
        x -= sign(hsp);
    }
    hsp = 0;
}


// ---------------------------------------------------------
//  COLLISION Y
// ---------------------------------------------------------
y += vsp;
if (place_meeting(x, y, oWall)) {
    while (place_meeting(x, y, oWall)) {
        y -= sign(vsp);
    }
    vsp = 0;
}


// ---------------------------------------------------------
//  SPRITE FLIP
// ---------------------------------------------------------
if (hsp > 0) image_xscale = 1;
else if (hsp < 0) image_xscale = -1;


// ---------------------------------------------------------
//  ROOM BORDERS
// ---------------------------------------------------------
var left   = 48;
var top    = -12;
var right  = 1376;
var bottom = 775;

x = clamp(x, left,  right  - sprite_width);
y = clamp(y, top,   bottom - sprite_height);


// ---------------------------------------------------------
//  IDLE BOUNCE + SWISH
// ---------------------------------------------------------
var moving = (abs(hsp) > 0.1) || (abs(vsp) > 0.1);

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


