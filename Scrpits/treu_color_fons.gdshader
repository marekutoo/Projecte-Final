shader_type canvas_item;

uniform vec4 color: source_color;
uniform float epsilon : hint_range(0.0, 0.1, 0.001) = 0.01;

void fragment() {
	vec4 pixel = texture(TEXTURE, UV);
	if (length(pixel.rgb - color.rgb) < epsilon){
		COLOR = vec4(0);
	}else{
		COLOR = pixel;
	}
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
