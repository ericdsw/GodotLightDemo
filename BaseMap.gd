extends Node2D

onready var map_sprite = get_node("Sprite")
onready var test_sprite = get_node("DebugSprite")
onready var light_viewport = get_node("LightViewport")
onready var day_night_filter = get_node("FilterZCalculator/DayNightFilter")
onready var camera = get_node("Elements/player/Camera2D")

func _ready() -> void:
	OS.window_size = Vector2(960, 540)
	light_viewport.set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	day_night_filter.adjust_to_map(get_map_rect())
	light_viewport.provide_camera(camera)

func _process(delta: float) -> void:
	light_viewport.adjust_to_map(get_map_rect())
	test_sprite.texture = light_viewport.get_texture()
	day_night_filter.update_lights(light_viewport.get_texture())

func get_map_rect() -> Rect2:
	var map_size = map_sprite.texture.get_size()
	return Rect2(
			map_sprite.position - map_size / 2.0,
			map_size
		)