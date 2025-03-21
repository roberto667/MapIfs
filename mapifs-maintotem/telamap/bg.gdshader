shader_type canvas_item;

uniform float screen_height = 270.0;


//void vertex() {
	// Called for every vertex the material is visible on.
//}

void fragment() {
	float diff_x = 0.075 * sin((10.0 * UV.y) + (2.0 * TIME));
	COLOR = texture(TEXTURE, vec2(UV.x + diff_x, UV.y));
	COLOR = mix(COLOR, vec4(0.0), float(int(UV.y * screen_height) % 2));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
