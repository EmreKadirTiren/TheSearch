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

