/// @description Initiate Particle Sys
part_system = part_system_create();
part_emit = part_emitter_create(part_system);

//create the particle
p_id = irandom(10000000);
ptype[p_id] = part_type_create();

//inherit the parameters
//Shapes or Sprites
if(part_type == "SHAPE"){
	//shape type
	part_type_shape(ptype[p_id], shape_type);
}else{
	//sprite type
	part_type_sprite(ptype[p_id], sprite_type, sprite_anim, false, false);	
}

//"Movement" Speed, Direction, Gravity, Orientation
part_type_speed(ptype[p_id], part_speed_min, part_speed_max, part_speed_increase, part_speed_wiggle);
part_type_size(ptype[p_id], part_size_min, part_size_max, part_size_increase, part_size_wiggle)
part_type_direction(ptype[p_id], part_dir_min, part_dir_max, part_dir_increase, part_dir_wiggle);
part_type_gravity(ptype[p_id], part_grav_amount, part_grav_direction);
part_type_orientation(ptype[p_id], part_angle_min, part_angle_max, part_angle_increase, part_angle_wiggle, part_angle_relative);

//Lifetime
part_type_life(ptype[p_id], part_life_min, part_life_max);

//Colors
if(part_color_type == "1 Color"){
	part_type_colour1(ptype[p_id], part_color_1);
}
if(part_color_type == "2 Colour (Random)"){
	part_type_colour_mix(ptype[p_id], part_color_1, part_color_2);
}
if(part_color_type == "2 Colour (Gradient)"){
	part_type_colour2(ptype[p_id], part_color_1, part_color_2);
}
if(part_color_type == "3 Colour (Gradient)"){
	part_type_colour3(ptype[p_id], part_color_1, part_color_2, part_color_3 );
}

//Alpha
if(part_alpha_type == "1 Alpha"){
	part_type_alpha1(ptype[p_id], part_alpha_1);
}
if(part_alpha_type == "2 Alpha"){
	part_type_alpha2(ptype[p_id], part_alpha_1, part_alpha_2);
}
if(part_alpha_type == "3 Alpha"){
	part_type_alpha3(ptype[p_id], part_alpha_1, part_alpha_2, part_alpha_3);
}

//Blending
part_type_blend(ptype[p_id], part_blend_additive);


alarm[1] = emit_speed;

show_debug_message(part_type)