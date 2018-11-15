/// @description Creates a new background of a given size and colour.
/// @param w The width of the background.
/// @param h The height of the background.
/// @param col The colour to clear the background to.
/// @returns {number} resource name for the new background
gml_pragma("forceinline")

// First-pass implementation - may need to add engine support if this causes problems
var __w = argument0;
var __h = argument1;
var __col = argument2;

var __CompTempSurf = surface_create(__w, __h);
var __spr = sprite_create_from_surface(__CompTempSurf, 0, 0, __w, __h, false, false, 0, 0)
surface_free(__CompTempSurf)
return __spr
/* Doesn't seem to need this code
if (surface_exists(__CompTempSurf))
{
	surface_set_target(__CompTempSurf);
	draw_clear(__col);
	surface_reset_target();
	
	var __sprid = sprite_create_from_surface(__CompTempSurf, 0, 0, __w, __h, false, false, 0, 0);
	surface_free(__CompTempSurf);
	return __sprid;
}
else
{
	return -1;
}
