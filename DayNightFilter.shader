shader_type canvas_item;

uniform vec4 color : hint_color = vec4(0.5,0.5,0.5,1.0);
uniform float contrast = 1.0;
uniform float saturation = 1.0;
uniform float brightness = 1.00;
uniform float pop_strength = 0.0;
uniform float pop_threshold = 1.0;
uniform float light_strength = 0.0;

uniform sampler2D lights : hint_albedo;

void fragment() { 
	
	// Initial Parameters
	vec3 light_color = texture(lights, UV).rgb * light_strength;
	vec3 base_color = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
	float grey = dot(base_color, vec3(0.299, 0.587, 0.114));
	
	// Overlay
	vec3 result_color = grey > 0.5 ? 1.0 - (1.0 - 2.0 * (base_color - 0.5)) * (1.0 - color.rgb) : 2.0 * base_color * color.rgb;
	
	// Saturation
	result_color = mix(vec3(grey), result_color, saturation);
	
	// Contrast
	result_color = (result_color - 0.5) * contrast + 0.5;
	
	// Pop Light
	result_color = result_color + pop_strength * max(grey - pop_threshold, 0.0);
	
	// Brightness
	result_color = result_color + brightness;
	
	// Lights
//	grey = dot(light_color, vec3(0.35));
//	result_color = mix(result_color, base_color * normalize(light_color + 0.05) * 2.2, grey);
//	result_color += 0.1 * light_color;
	
	// Assign the color
	COLOR = vec4(result_color, 1.0);
}