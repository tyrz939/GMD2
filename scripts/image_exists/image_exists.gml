/// @description image_exists(image)
/// @function image_exists
/// @param image
gml_pragma("forceinline");

if( ds_exists( argument0 , ds_type_grid ) ){
    if( ds_grid_height( argument0 ) == 1 ){
        return true;
    } else {
        return false;
    }
} else {
    return false;
}
