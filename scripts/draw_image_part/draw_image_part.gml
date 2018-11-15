/// @description draw_image_part(sprite,subimg,left,top,width,height,x,y)
/// @function draw_image_part
/// @param sprite
/// @param subimg
/// @param left
/// @param top
/// @param width
/// @param height
/// @param x
/// @param y
gml_pragma("forceinline"); // in YYC, proccessing boost but it inflates the final exe size

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_sprite_part(
    argument0[# 6 + _c_subimg , 0 ] , 
	0 ,
    argument0[# 7 + _c_subimg , 0 ] + argument2 ,
    argument0[# 8 + _c_subimg , 0 ] + argument3 ,
    argument4 ,
    argument5 ,
    argument6 ,
    argument7
);
