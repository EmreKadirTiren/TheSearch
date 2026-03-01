if (!instance_exists(oPlayer)) exit;

var d = point_distance(x, y, oPlayer.x, oPlayer.y);


// -------------------------
// FIGHT STATE (boss valt aan)
// -------------------------
if (state == "fight") {


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
