shader_type canvas_item;

uniform vec3 color:source_color;
uniform float epsilon:hint_range(0.0, 0.1, 0.01) = 0.01;

void fragment() {
	vec4 pixel = texture(TEXTURE, UV);
	if (abs(pixel.r - color.r) < epsilon && abs(pixel.g - color.g) < epsilon && abs(pixel.b - color.b) < epsilon){
		COLOR = vec4(0);
	}else{
		COLOR = pixel;
	}
}
