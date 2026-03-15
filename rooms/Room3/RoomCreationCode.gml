global.last_level_room=Room3;
// Code 1
if (global.bossdied == true) {
    audio_stop_all();
    audio_play_sound(boss_music, 1, true);
}