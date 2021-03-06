/// @description draw_image_pos(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,alpha)
/// @function draw_image_pos
/// @param sprite
/// @param subimg
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
/// @param alpha
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
var _bck = argument0[# 6 + _c_subimg , 0 ];

var _u_x = argument0[# 7 + _c_subimg , 0 ] / sprite_get_width( _bck );
var _u_y = argument0[# 8 + _c_subimg , 0 ] / sprite_get_height( _bck );
var _u_w = argument0[# 2 , 0 ] / sprite_get_width( _bck );
var _u_h = argument0[# 3 , 0 ] / sprite_get_height( _bck );

draw_set_alpha( argument10 );
draw_primitive_begin_texture( pr_trianglelist , sprite_get_texture( _bck, 0 ) );
    draw_vertex_texture( argument2 , argument3 , _u_x , _u_y );
    draw_vertex_texture( argument4 , argument5 , _u_x+_u_w , _u_y );
    draw_vertex_texture( argument6 , argument7 , _u_x+_u_w , _u_y+_u_h );
    
    draw_vertex_texture( argument8 , argument9 , _u_x , _u_y+_u_h );
    draw_vertex_texture( argument2 , argument3 , _u_x , _u_y );
    draw_vertex_texture( argument6 , argument7 , _u_x+_u_w , _u_y+_u_h );
draw_primitive_end();
