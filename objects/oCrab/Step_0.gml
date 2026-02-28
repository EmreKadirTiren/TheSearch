var tx = (target == 1) ? x1 : x2; // delta x
var ty = (target == 1) ? y1 : y2; // delta y

var dir = point_direction(x, y, tx, ty); // 
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

// if close enough, switch target
if (point_distance(x, y, tx, ty) <= spd) {
    x = tx; y = ty;
    target = (target == 1) ? 2 : 1;
}