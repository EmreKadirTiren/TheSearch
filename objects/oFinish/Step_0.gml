var touching_player = place_meeting(x, y, oPlayer);
var pressed_E = keyboard_check_pressed(ord("E"));
var pressed_controller = gamepad_button_check_pressed(0, gp_face1); 

if (touching_player && (pressed_E || pressed_controller)) {
    room_goto(Start);
}
