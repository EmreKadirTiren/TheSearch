// Normale player
draw_sprite_ext(
    sprite_index,
    image_index,
    x + bounce_x,
    y + bounce_y,
    image_xscale,
    image_yscale,
    image_angle,
    image_blend,
    image_alpha
);

// Glow tijdens boost
if (boost_active) {
    gpu_set_blendmode(bm_add);
    draw_sprite_ext(
        sprite_index,
        image_index,
        x + bounce_x,
        y + bounce_y,
        image_xscale,
        image_yscale,
        image_angle,
        c_aqua,
        0.4
    );
    gpu_set_blendmode(bm_normal);
}

