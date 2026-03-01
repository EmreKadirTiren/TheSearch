var full = dialogue[i];

if (!line_done) {
    char_i += type_spd;
    if (char_i >= string_length(full)) {
        char_i = string_length(full);
        line_done = true;
    }
    shown = string_copy(full, 1, char_i);
}

// if any button is pressed
if (keyboard_check_pressed(vk_anykey)) {
    if (!line_done) { //and dialogue is not done
        char_i = string_length(full);
        shown = full;
        line_done = true;
    } else { //if line is done
        if (i < array_length(dialogue) - 1) {
            i++;
            char_i = 0;
            shown = "";
            line_done = false;
        } else { //go to next room
            room_goto(Room1);
        }
    }
}