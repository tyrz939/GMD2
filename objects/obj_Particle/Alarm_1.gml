/// @description Insert description here
// You can write your code in this editor
if(enabled){
	if(emit_type == "stream"){
		part_emitter_stream(part_system, part_emit, ptype[p_id], part_volume);
	}else{
		part_emitter_burst(part_system, part_emit, ptype[p_id], part_volume);
	}
}
alarm[1] = emit_speed;