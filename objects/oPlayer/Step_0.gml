var pad  = 0;
var dead = 0.2;

// keyboard
var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
var my = keyboard_check(vk_down)  - keyboard_check(vk_up);

// controller overrides keyboard if used
if (gamepad_is_connected(pad)) {
    var gx = gamepad_axis_value(pad, gp_axislh);
    var gy = gamepad_axis_value(pad, gp_axislv);

    if (abs(gx) > dead) mx = gx;
    if (abs(gy) > dead) my = gy;
}

// apply movement
hsp = (hsp + mx * accel) * drag;
vsp = (vsp + my * accel) * drag;

hsp = clamp(hsp, -max_speed, max_speed);
vsp = clamp(vsp, -max_speed, max_speed);

x += hsp;
y += vsp;

// flip sprite
if (hsp > 0) image_xscale = 1;
else if (hsp < 0) image_xscale = -1;


// player cant get out of border

var margin = 48; // pas aan: 8/16/24/32... wat jouw border dikte/offset is

var left   = 48;
var top    = -12;
var right  = 1376 ; // of room_width  - margin
var bottom = 775; // of room_height - margin

// als je origin linksboven is:
x = clamp(x, left,  right  - sprite_width);
y = clamp(y, top,   bottom - sprite_height);

// Beweegt de speler?
var moving = (abs(hsp) > 0.1) || (abs(vsp) > 0.1);

// Idle timer
if (!moving) {
    idle_time += delta_time / 1000000; // seconden
} else {
    idle_time = 0;
    is_bouncing = false;
}

// Start bounce na 2 seconden
if (idle_time > 2) {
    is_bouncing = true;
}

// Subtiele bounce (1–2 pixels)
if (is_bouncing) {
    bounce_offset = sin(current_time / 200) * 5;
} else {
    bounce_offset = 0;
}
