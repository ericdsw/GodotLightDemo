extends ColorRect

func _process(delta: float) -> void:
	update()

func _draw() -> void:
	pass
	
#	for light in get_tree().get_nodes_in_group("Lights"):
#
#		var emitter_texture = light.texture
#		var light_texture = light.get_node("LightSource").texture
#
#		var emitter_position = light.global_position
#		var light_position = emitter_position + light.get_node("LightSource").position
#
#		draw_texture(light_texture, light_position - light_texture.get_size() / 2.0)
#		draw_texture(emitter_texture, emitter_position - emitter_texture.get_size() / 2.0, Color("#000000"))