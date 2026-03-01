var d = point_distance(x, y, oPlayer.x, oPlayer.y);

// -------------------------
// IDLE STATE (wachten op E)
// -------------------------
if (state == "idle") {
    if (d < talk_range && keyboard_check_pressed(ord("E"))) {

        // Dialoog tonen
        dialogue_text = "Je durft mij uit te dagen? Dan zal ik je kracht testen!";
        show_dialogue = true;

        // Start gevecht
        state = "fight";
    }
}

// -------------------------
// FIGHT STATE (boss valt aan)
// -------------------------
if (state == "fight") {

    // Boss kijkt naar speler
    if (oPlayer.x < x) image_xscale = -1;
    else image_xscale = 1;

    // Timer voor aanvallen
    attack_timer += 1;

    // Elke 60 frames (1 seconde) schiet de boss een projectile
    if (attack_timer >= 60) {
        instance_create_layer(x, y, "Instances", oFerranProjectile);
        attack_timer = 0;
    }

    // Check of boss dood is
    if (hp <= 0) {
        state = "dead";
    }
}

// -------------------------
// DEAD STATE
// -------------------------
if (state == "dead") {
    room_goto(Dialogue3_1); // of animatie, of room_goto()
}
if (hp <= 0) {
    state = "dead";
}
