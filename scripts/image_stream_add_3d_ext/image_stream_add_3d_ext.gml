/// @description image_stream_add_3d(group,identifier,fname,subimg,xorig,yorig)
/// @function image_stream_add_3d
/// @param group
/// @param identifier
/// @param fname
/// @param subimg
/// @param xorig
/// @param yorig
var _l = global.m_ex_image[? argument0 ];

// Error checking
if( ds_list_size( _l ) != 3 ){
    show_error( "Image stream not started " + chr(13) + "Group: " + string( argument0 ) + chr(13) + "Identifier " + string( argument1 ), true );
    return false; 
}

var _m = _l[| 2 ];
var _p_sprite_3d = _m[? "sprite_3d" ];

//var _spr = sprite_add( argument2 , argument3 , false , false , argument4 , argument5 );
// MY CODE

if file_exists(argument2) {
	var _spr_t = sprite_add( argument2 , 0 , false , false , 0 , 0 );
} else {
	show_message("File '" + argument2 + "' Doesn't exist")
	return 0
}
gpu_set_blendenable(false)
var _surf_t = surface_create(sprite_get_width(_spr_t ), sprite_get_height(_spr_t ))
surface_set_target(_surf_t)
//draw_clear_alpha(c_white, 0)
draw_sprite(_spr_t, 0, 0, 0)
surface_reset_target()
var _spr = sprite_create_from_surface(_surf_t, argument6, argument7, argument8, argument9, false, false, argument4, argument5)
var _w = 1
var _h = 0
var _sx, _sy
for(var _i = 1; _i < argument3; _i++) {
	if _w >= argument10 {
		_w -= argument10
		_h++
	}
	_sx = argument6 + (_w * argument8) + (argument11 * _w)
	_sy = argument7 + (_h * argument9) + (argument12 * _h)
	sprite_add_from_surface(_spr, _surf_t, _sx, _sy, argument8, argument9, false, false)
	_w++
}
surface_free(_surf_t)
sprite_delete(_spr_t)
gpu_set_blendenable(true)
// MY CODE
var _priority = floor( ( sprite_get_width( _spr ) + sprite_get_height( _spr ) ) / 2 );
var _l = ds_list_create();

ds_list_add( _l , _spr , string( argument1 ) , argument2 );
if( _priority <= 1 and !file_exists( argument2 ) ){
    var _l_loading_3d = _m[? "loading_3d" ];
    ds_list_add( _l_loading_3d , _l );
    _m[? "finished" ] = false;
}

ds_priority_add(
    _p_sprite_3d ,
    _l ,
    _priority
);

// back_req , identifier , subimg , xorig , yorig , link , loaded


