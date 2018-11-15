gml_pragma( "global", "config();");
gml_pragma( "global", "__init_d3d();");
gml_pragma( "PNGCrush")
//gml_release_mode(true);
layer_force_draw_depth(true, 0); // force all layers to draw at depth 0

// Get shortcut parameters
global.debug = true
var p = parameter_count();
if p > 0 {
    for (var i = 0; i < p; i += 1) {
       if parameter_string(i + 1) == string("-debug") {global.debug = true}
    }
}

// Misc
global.name = "GMDanmaku 2 Alpha"
window_set_caption(global.name + " v" + GM_version)

// Replay Path
global.replayPath = "replay/"

// Global Variables
global.playerNumber = -1
global.difficulty = -1
global.__shotCreateType = -1

// For Sound
global.prevSfx = -1

// Graphic Settings
gpu_set_tex_mip_bias(0);
gpu_set_tex_min_mip(0);
gpu_set_tex_max_mip(4);
draw_set_circle_precision(64);

// Menu Config
global.menuSpacing = 40
global.menuPulseColor = make_color_rgb(255, 95, 63)
global.menuTextColor = c_ltgray
global.menuGrayColor = c_dkgray
global.menuPulse = false

// Lua
global.__prevLuaError = ""

// Pickup item enum
enum pickup_t {
	POWER,
	POWER8,
	STAR,
	LIFE,
	BOMB,
	FULL,
	SCORE
}

// Bullet Create Type enum
enum bulletType_t {
	shotGroup,
	laserGroup,
	staticLaserGroup,
	delayLaser
}

// Score Constants
#macro SCORE_PICKUP_STAR 50
#macro SCORE_PICKUP_SCORE 1000
#macro SCORE_DAMAGE_MULTIPLIER 1

// Depths
#macro BG_DEPTH 16000
#macro BOSS_BACKGROUND_IMAGE_DEPTH 1000
#macro BOMB_DEPTH 900
#macro ENEMY_DEPTH 880
#macro PLAYER_DEPTH 860
#macro PLAYER_SHOT_DEPTH 840
#macro PLAYER_ORB_DEPTH 820
#macro PLAYER_LASER_DEPTH 800
#macro PICKUP_DEPTH 780
#macro SHOT_DEPTH 10
#macro HITBOX_DEPTH 5
#macro DEATH_EFFECT_DEPTH 3
#macro BOSS_HP_DEPTH 2

#macro LOAD_DEPTH -100
#macro BOSS_INFO_DEPTH -100
#macro DIALOGUE_DEPTH -200
#macro INTERFACE_DEPTH -300
#macro PAUSE_MENU_DEPTH -400

// Delete Type
#macro DELTYPE_INSTANT 0
#macro DELTYPE_ANIMATED 1
#macro DELTYPE_ITEM 2

// Hitbox Type
#macro CIRCLE 0
#macro OVAL 1
#macro RECTANGLE 2
#macro LASER 3
#macro STATICLASER 4