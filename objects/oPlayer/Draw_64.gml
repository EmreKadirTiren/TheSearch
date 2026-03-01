// PLAYER HP BAR
var bar_w = 200; // breedte van de balk
var bar_h = 20;  // hoogte van de balk

// Achtergrond
draw_set_color(c_black);
draw_rectangle(20, 20, 20 + bar_w, 20 + bar_h, false);

// HP (rood)
draw_set_color(c_red);
draw_rectangle(20, 20, 20 + (hp / 10) * bar_w, 20 + bar_h, false);

// Tekst
draw_set_color(c_white);
draw_text(25, 22, "HP: " + string(hp));
