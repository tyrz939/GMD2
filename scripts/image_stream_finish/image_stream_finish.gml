/// @description image_stream_finish(group)
/// @function image_stream_finish
/// @param group
if( !image_stream_is_received( string( argument0 ) ) ){
    show_error( "The image stream has not finished yet" + chr(13) + "Group: " + string( argument0 ) , true );
    return false;
}

var _l            = global.m_ex_image[? string( argument0 ) ];
var _l_image      = _l[| 0 ];
var _l_background = _l[| 1 ];
var _m_stream     = _l[| 2 ];

var _p_sprite    = _m_stream[? "sprite" ];
var _p_sprite_3d = _m_stream[? "sprite_3d" ];
var _width     = _m_stream[? "w" ];
var _height    = _m_stream[? "h" ];
var _sep       = _m_stream[? "sep" ];

var _begin_alpha  = draw_get_alpha();
var _begin_colour = draw_get_colour();
draw_set_alpha( 1.0 );
draw_set_colour( c_white );

gpu_set_blendenable( false );

// CREATE THE DATA STRUCTURES NECESSARY FOR ADDING THE SPRITES ON THE TEXTURE PAGE
var _l_areas = ds_list_create();
var _q_trash = ds_queue_create();
ds_list_add( _l_areas , _sep , _sep , _width - _sep , _height - _sep );

var _l_texpage = ds_list_create();
var _back = background_create_colour( _width , _height , c_black );
ds_list_add( _l_texpage , 
    surface_create( _width , _height ) , 
    _back
);

surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
draw_clear_alpha( 0,0 ); // this can be removed
var _spr = -1;

while( ds_priority_size( _p_sprite ) ){ // LOOP THROUGH THE SPRITES AND ADD THEM TO THE TEXTURE PAGE WHERE POSSIBLE
    var _l_img = ds_priority_delete_max( _p_sprite );
    _spr = _l_img[| 0 ];
    
    var spr_number = sprite_get_number( _spr );
    var subimg_w = sprite_get_width( _spr );
    var _image_drawn = false;
    var _image_maindata_added = false;
    for( var i = 0; i < sprite_get_number( _spr ); i++ ){
        var _min_area_size = $10000000000000;
        var _min_area_id   = -1;
        for( var n = 0; n < ds_list_size( _l_areas ); n += 4 ){
            if( subimg_w <= _l_areas[| n + 2 ] and sprite_get_height( _spr ) <= _l_areas[| n + 3 ] ){
                if( ( ( _l_areas[| n + 2 ] + _l_areas[| n + 3 ] ) / 2 ) < _min_area_size ){
                    _min_area_size = ( _l_areas[| n + 2 ] + _l_areas[| n + 3 ] ) / 2;
                    _min_area_id = n;
                }
            }
        }
        
        // DRAW THE IMAGES ON THE TEXTURE PAGE
        if( _min_area_id != -1 ){
            n = _min_area_id;
            draw_sprite_part( _spr , i , 0  , 0 , subimg_w , sprite_get_height( _spr ) , _l_areas[| n ] , _l_areas[| n + 1 ] );
            
            _image_drawn = true;
            
            if( !_image_maindata_added ){
                // CREATE THE GRID FOR THE IMAGE DATA
                var _g_image = ds_grid_create( 7 + sprite_get_number( _spr ) * 3 , 1 );
                ds_list_add( _l_image , _g_image );
                var _pos = 0;
                // ADD THE MAIN DATA OF THE SPRITE TO THE SPRITE DATA STRUCTURE
                _g_image[# _pos , 0 ] = _l_img[| 1 ]; _pos++;              // IDENTIFIER
                _g_image[# _pos , 0 ] = sprite_get_number( _spr ); _pos++; // SUBIMAGE
                _g_image[# _pos , 0 ] = subimg_w; _pos++;                  // SUBIMAGE WIDTH
                _g_image[# _pos , 0 ] = sprite_get_height( _spr ); _pos++; // SUBIMAGE HEIGHT
                _g_image[# _pos , 0 ] = sprite_get_xoffset( _spr ); _pos++;// XORIGIN
                _g_image[# _pos , 0 ] = sprite_get_yoffset( _spr ); _pos++;// YORIGIN
                _image_maindata_added = true;
            }
            
            // ADD THE SUBIMAGE OF THE SPRITE TO THE SPRITE DATA STRUCTURE
            _g_image[# _pos , 0 ] = _back; _pos++;              // BACKGROUND
            _g_image[# _pos , 0 ] = _l_areas[| n ]; _pos++;     // X
            _g_image[# _pos , 0 ] = _l_areas[| n + 1 ]; _pos++; // Y
            
            if( i == sprite_get_number( _spr ) - 1 ){
                _g_image[# _pos , 0 ] = _l_img[| 2 ]; // FNAME
            }

            // ADD THE NEW EMPTY AREAS TO THE AREA LIST
            if( sprite_get_height( _spr ) < _l_areas[| n + 3 ] ){              // Y                                          W                           H
                ds_list_add( _l_areas , _l_areas[| n ] , _l_areas[| n + 1 ] + sprite_get_height( _spr ) + _sep , _l_areas[| n + 2 ] , _l_areas[| n + 3 ] - sprite_get_height( _spr ) - _sep );
            }
            if( subimg_w < _l_areas[| n + 2 ] ){ // X                                 Y                                          W                           H
                ds_list_add( _l_areas , _l_areas[| n ] + subimg_w + _sep , _l_areas[| n + 1 ] , _l_areas[| n + 2 ] - subimg_w - _sep , sprite_get_height( _spr ) );
            }
            
            // REMOVE THE CURRENT AREA FROM THE AREA LIST
            repeat( 4 )
                ds_list_delete( _l_areas , n );
        } else {
            ds_list_clear( _l_areas );
            ds_list_add( _l_areas , _sep , _sep , _width - _sep , _height - _sep );
            
            _back = background_create_colour( _width , _height , c_black );
            ds_list_add( _l_texpage , surface_create( _width , _height ) , _back);
            surface_reset_target();
            surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
            draw_clear_alpha( 0,0 );
            
            i--;
        }
    }
    
    if( ds_list_size( _l_areas ) == 0 ){
        //show_debug_message( "Warning: Something went wrong, creating another texturepage" );
        
        ds_list_clear( _l_areas );
        ds_list_add( _l_areas , _sep , _sep , _width - _sep , _height - _sep );
        
        _back = background_create_colour( _width , _height , c_black );
        ds_list_add( _l_texpage , surface_create( _width , _height ) , _back );
        surface_reset_target();
        surface_set_target( _l_texpage[| ds_list_size( _l_texpage ) - 2 ] );
    }
    if( _image_drawn ){
        ds_list_destroy( _l_img );
        ds_queue_enqueue( _q_trash , _spr );
    }
}
surface_reset_target();

// Clear memory
while( ds_queue_size( _q_trash ) > 0 ){
    sprite_delete( ds_queue_dequeue( _q_trash ) );
}
// CREATE THE BACKGROUND (TEXTUREPAGE)
for( var n = 0; n < ds_list_size( _l_texpage ); n += 2 ){
    var _back_temp = sprite_create_from_surface( _l_texpage[| n ] , 0 , 0 , surface_get_width( _l_texpage[| n ] ) , surface_get_height( _l_texpage[| n ] ) , false , false, 0, 0 );
    sprite_assign( _l_texpage[| n + 1 ] , _back_temp );
    ds_list_add( _l_background , _l_texpage[| n + 1 ] );
    sprite_delete( _back_temp );
    surface_free( _l_texpage[| n ] );
}


// 3D specific images.
while( ds_priority_size( _p_sprite_3d ) > 0 ){
    var _l_img      = ds_priority_delete_max( _p_sprite_3d );
    var _spr        = _l_img[| 0 ];
    var _identifier = _l_img[| 1 ];
    var _subimg     = sprite_get_number( _spr );
    var _xorig      = sprite_get_xoffset( _spr );
    var _yorig      = sprite_get_yoffset( _spr );;
    var _w          = sprite_get_width( _spr );
    var _surface    = surface_create( _w , sprite_get_height( _spr ) );
    
    var _g_image = ds_grid_create( 7 + _subimg * 3 , 1 );
    ds_list_add( _l_image , _g_image );
    var _pos = 0;
    _g_image[# _pos , 0 ] = _identifier; _pos++;                    // IDENTIFIER
    _g_image[# _pos , 0 ] = _subimg; _pos++;                        // SUBIMAGE
    _g_image[# _pos , 0 ] = _w; _pos++;                             // SUBIMAGE WIDTH
    _g_image[# _pos , 0 ] = sprite_get_height( _spr ); _pos++;      // SUBIMAGE HEIGHT
    _g_image[# _pos , 0 ] = _xorig; _pos++;                         // XORIGIN
    _g_image[# _pos , 0 ] = _yorig; _pos++;                         // YORIGIN
    
    for( var n = 0; n < _subimg; n++ ){
        surface_set_target( _surface );
        draw_clear_alpha( c_red , 1 );
        draw_sprite_part( _spr , n , 0 , 0 , n * _w + _w , sprite_get_height( _spr ) , 0 , 0 );
        surface_reset_target();
        var _back_subimg = sprite_create_from_surface( _surface , 0 , 0 , _w , sprite_get_height( _spr ) , false , false, 0, 0 );
        ds_list_add( _l_background , _back_subimg );
        _g_image[# _pos , 0 ] = _back_subimg; _pos++; // BACKGROUND
        _g_image[# _pos , 0 ] = 0; _pos++;            // X
        _g_image[# _pos , 0 ] = 0; _pos++;            // Y
    }
    _g_image[# ds_grid_width( _g_image ) - 1 , 0 ] = _l_img[| 2 ]; // FNAME
    
    surface_free( _surface );
    sprite_delete( _spr );
    ds_list_destroy( _l_img );
}
gpu_set_blendenable( true );

draw_set_alpha( _begin_alpha );
draw_set_colour( _begin_colour );

// Clear memory
ds_list_destroy( _l_areas );
ds_priority_destroy( _p_sprite );
ds_priority_destroy( _p_sprite_3d );
ds_list_destroy( _m_stream[? "loading" ] );
ds_list_destroy( _m_stream[? "loading_3d" ] );
ds_queue_destroy( _q_trash );
ds_list_destroy( _l_texpage );    
ds_list_delete( global.m_ex_image[? string( argument0 ) ] , 2 );

return true;
