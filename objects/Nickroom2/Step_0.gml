var d = point_distance(x, y, oPlayer.x, oPlayer.y);

if (d < talk_range) {
    if (keyboard_check_pressed(ord("E"))) {
        room_goto(Dialogue2);
    }
}
