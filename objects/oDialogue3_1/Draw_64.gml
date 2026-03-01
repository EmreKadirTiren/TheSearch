//Dialogue box

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

var margin = 16;
var box_h = 90;
var box_y = gui_h - box_h - margin;

// achtergrond
draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(margin, box_y, gui_w - margin, box_y + box_h, false);

// rand
draw_set_alpha(1);
draw_set_color(c_white);
draw_rectangle(margin, box_y, gui_w - margin, box_y + box_h, true);

// --- bepaal spreker van huidige regel ---
var sid = speaker_id[i]; // 0 player / 1 npc
var nm = speaker_name[sid];
var col = speaker_color[sid];

// naam linksboven (gekleurde naam)
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(col);
draw_text(margin + 16, box_y + 6, nm);

// tekst (wit)
draw_set_color(c_white);
draw_text(margin + 16, box_y + 26, shown);

// pijltje
if (line_done) {
    draw_set_halign(fa_right);
    draw_text(gui_w - margin - 16, box_y + box_h - 24, ">>");
}