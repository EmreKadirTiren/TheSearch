var d = point_distance(x, y, oPlayer.x, oPlayer.y);

if (d < talk_range && global.luukfish >= 3) {
    if (keyboard_check_pressed(ord("E"))) {
        room_goto(Dialogue2);
    }}
else if (d < talk_range && global.luukfish < 3){
	    if (keyboard_check_pressed(ord("E"))) {
        room_goto(Dialogue2_2);
}}