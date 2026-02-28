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

