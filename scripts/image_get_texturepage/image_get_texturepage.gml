/// @description image_get_texturepage(sprite,subimg)
/// @function image_get_texturepage
/// @param sprite
/// @param subimg
gml_pragma("forceinline"); 

var _c_subimg = ( floor(argument1) mod argument0[# 1 , 0 ] ) * 3;
return( argument0[# 6 + _c_subimg , 0 ] );
