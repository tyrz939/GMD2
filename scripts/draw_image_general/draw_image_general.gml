/// @description draw_image_general(sprite,subimg,left,top,width,height,x,y,xscale,yscale,rot,c1,c2,c3,c4,alpha)
/// @function draw_image_general
/// @param sprite
/// @param subimg
/// @param left
/// @param top
/// @param width
/// @param height
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rot
/// @param c1
/// @param c2
/// @param c3
/// @param c4
/// @param alpha
gml_pragma("forceinline"); // in YYC, proccessing boost

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
draw_sprite_general(
    argument0[# 6 + _c_subimg , 0 ] , 
	0 ,
    argument0[# 7 + _c_subimg , 0 ] + argument2 ,
    argument0[# 8 + _c_subimg , 0 ] + argument3 ,
    argument4 ,
    argument5 ,
    argument6 ,
    argument7 ,
    argument8 ,
    argument9 ,
    argument10 ,
    argument11 ,
    argument12 ,
    argument13 ,
    argument14 ,
    argument15
);
