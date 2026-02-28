draw_sprite_ext(
    sprite_index,
    image_index,
    x,
    y + bounce_offset, // subtiele 1–2 px bounce
    image_xscale,
    image_yscale,
    image_angle,
    image_blend,
    image_alpha
) rot = sin(current_time / 300) * 2; // 2 graden wiebel
draw_sprite_ext(sprite_index, image_index, x, y + bounce_offset, image_xscale, image_yscale, rot, image_blend, image_alpha);

