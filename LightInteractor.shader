shader_type canvas_item;

void light() {
	
	float vertical_distance = LIGHT_VEC.y + ((1.0 - UV.y) / TEXTURE_PIXEL_SIZE.y);

	// Only apply if the vertical distance is greater than 0
	if (vertical_distance > 0.0) {
		float used_value = 15.0 / (vertical_distance * 0.8);
		LIGHT *= clamp(used_value, 0.0, 1.0);
	}

}