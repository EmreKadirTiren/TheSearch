// Dialoog tonen
if (show_dialogue) {
    draw_set_color(c_white);
    draw_text(32, 32, dialogue_text);
}

// Boss HP-bar alleen tijdens gevecht
if (state == "fight") {

    var bar_w = 300;
    var bar_h = 20;

    // Achtergrond
    draw_set_color(c_black);
    draw_rectangle(room_width/2 - bar_w/2, 20, room_width/2 + bar_w/2, 20 + bar_h, false);

    // HP (paars)
    draw_set_color(make_color_rgb(180, 0, 255));
    draw_rectangle(room_width/2 - bar_w/2, 20, room_width/2 - bar_w/2 + (hp / 10) * bar_w, 20 + bar_h, false);

    // Tekst
    draw_set_color(c_white);
    draw_text(room_width/2 - 20, 22, "Ferran HP: " + string(hp));
}
