extends Viewport

onready var light_rect = get_node("LightRect")
onready var object_rect = get_node("ObjectRect")
var camera : Camera2D

func provide_camera(_camera: Camera2D) -> void:
	camera = _camera

func adjust_to_map(map_rect: Rect2) -> void:
	
	size = map_rect.size
	
	light_rect.rect_size = map_rect.size
	object_rect.rect_size = map_rect.size

func _process(delta: float) -> void:
	if camera != null:
		light_rect.rect_position = -camera.global_position
		object_rect.rect_position = -camera.global_position