extends ColorRect

onready var lights = get_tree().get_nodes_in_group("Lights")

func _process(delta: float) -> void:
	update()

func _draw() -> void:
	
	pass
	
#	for object in get_tree().get_nodes_in_group("Object"):
#
#		var texture = object.texture
#		var position = object.global_position
#		var modulate_color = Color(0,0,0,0)
#
#		var floor_position = position + Vector2(0, texture.get_size().y / 2.0)
#
#		var used_opacity = 0.0
#
#		for light in lights:
#
#			var light_source = light.get_node("LightSource")
#			var light_radius = light_source.texture.get_size().x / 2.0 + texture.get_size().y
#			var diff = floor_position - light_source.global_position
#
##			if diff.y <= 20 and abs(diff.x) < 10:
##				light_radius += texture.get_size().y
#
#			if floor_position.distance_to(light_source.global_position) > light_radius or diff.y <= 0:
#				continue
#
##			if abs(diff.y) > light_radius:
##				continue
#
##			print("affected by ", light.name)
#
#			var calc_opacity = clamp((diff.y - 5.0) / 50.0, 0.0, 1.0)
#			if diff.y <= 10:
#				calc_opacity = 0.0
#
#			if used_opacity == 0:
#				used_opacity = calc_opacity
#			else:
#				if used_opacity > calc_opacity:
#					used_opacity = calc_opacity
##				used_opacity = (used_opacity + calc_opacity) / 2.0
##			if used_opacity > calc_opacity or used_opacity == 0:
##				used_opacity = calc_opacity
#
#		modulate_color.a = used_opacity
#		draw_texture(texture, position - texture.get_size() / 2.0, modulate_color)
			
