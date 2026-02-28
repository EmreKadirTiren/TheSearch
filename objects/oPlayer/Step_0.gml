var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down)  - keyboard_check(vk_up);

// Accelerate
hsp += h * accel;
vsp += v * accel;

// Drag (water resistance)
hsp *= drag;
vsp *= drag;

// Limit speed
var spd = point_distance(0, 0, hsp, vsp);
if (spd > max_speed) {
    var dir = point_direction(0, 0, hsp, vsp);
    hsp = lengthdir_x(max_speed, dir);
    vsp = lengthdir_y(max_speed, dir);
}

// Move
x += hsp;
y += vsp;

// Flip sprite based on horizontal speed
if (hsp > 0) {
    image_xscale = 1;   // facing right
}
else if (hsp < 0) {
    image_xscale = -1;  // facing left
}


// Movement input (keyboard + controller) -> hsp/vsp

var pad  = 0;
var dead = 0.2;

// keyboard
var mx = keyboard_check(vk_right) - keyboard_check(vk_left);
var my = keyboard_check(vk_down)  - keyboard_check(vk_up);

// controller (left stick) overwrites keyboard if used
if (gamepad_is_connected(pad)) {
    var gx = gamepad_axis_value(pad, gp_axislh);
    var gy = gamepad_axis_value(pad, gp_axislv);

    if (abs(gx) < dead) gx = 0;
    if (abs(gy) < dead) gy = 0;

    if (gx != 0) mx = gx;
    if (gy != 0) my = gy;
}

// apply to your speeds (uses your Create vars: accel/drag/max_speed)
hsp = (hsp + mx * accel) * drag;
vsp = (vsp + my * accel) * drag;

hsp = clamp(hsp, -max_speed, max_speed);
vsp = clamp(vsp, -max_speed, max_speed);
