extends TextureRect

# COLOR - CONTRAST - SATURATION - BRIGHTNESS - POP_STR - POP_T - LIGHT_STR
var midnight = DayTimeProperties.new(Color("#0f3abc"), 0.3, 1.0, -0.40, 0.70, 0.75, 1.2)
var dawn = DayTimeProperties.new(Color("#b79c4d"), 0.85, 0.95, -0.45, 0.1, 1.00, 0.8)
var dusk = DayTimeProperties.new(Color("#b79c4d"), 0.85, 0.95, -0.45, 0.1, 1.00, 0.8)
var day = DayTimeProperties.new(Color("#808080"), 1.0, 1.0, 0.0, 0.0, 1.00, 0.0)
var night_2 = DayTimeProperties.new(Color("#5050b9"), 0.8, 0.7, -0.30, 0.20, 0.70, 0.7)

func adjust_to_map(map_rect: Rect2) -> void:
	rect_position = Vector2()
	rect_size = map_rect.size

func update_lights(light_texture: Texture) -> void:
	material.set_shader_param("lights", light_texture)

func apply_properties(properties: DayTimeProperties) -> void:
	
	material.set_shader_param("color", properties.filter_color)
	material.set_shader_param("contrast", properties.contrast)
	material.set_shader_param("saturation", properties.saturation)
	material.set_shader_param("brightness", properties.brightness)
	material.set_shader_param("pop_strength", properties.pop_strength)
	material.set_shader_param("pop_threshold", properties.pop_threshold)
	
	for light in get_tree().get_nodes_in_group("Light"):
		light.energy = properties.light_strength
#	for light_sprite in get_tree().get_nodes_in_group("LightSprite"):
#		light_sprite.modulate.a = properties.light_strength
	
#	material.set_shader_param("light_strength", properties.light_strength)