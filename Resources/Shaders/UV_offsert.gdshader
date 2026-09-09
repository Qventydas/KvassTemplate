shader_type canvas_item;
uniform lowp float offset_x = 0.0;
uniform lowp float offset_y = 0.0;
uniform sampler2D text : filter_nearest, repeat_enable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 new_text = texture(text, UV + vec2(offset_x,offset_y));
	COLOR = new_text;
	//COLOR = vec4(0.9);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
