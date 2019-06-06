# Used to set depth to sprites that need it.
# If the point where another object overlaps needs to be different,
# add a `Position2D` node to the sprite and name it `floor`.
extends Sprite
class_name ObjectSprite

var is_opaque = true
var height = 0
var current_elevation = 0.0 setget _set_elevation, _get_elevation
var floor_y

var is_static = false

signal elevation_changed()

# ================================ Lifecycle ================================ #

func _ready() -> void:
	
	set_process(true)
	
	if has_node("floor"):
		floor_y = get_node("floor").global_position.y
	
	if get_texture() != null:
		height = get_texture().get_size().y / 2

	_calculate_z_index()

func _process(delta: float) -> void:
	if !is_static:
		_calculate_z_index()

# ================================= Private ================================= #

func _set_elevation(value: float) -> void:
	current_elevation = value
	emit_signal("elevation_changed")

func _get_elevation() -> float:
	return current_elevation

func _calculate_z_index():
	
	# Calculate the z-index with the "floor" node's position
	if !has_node("floor"):
		z_index = clamp(
			global_position.y + height, 
			VisualServer.CANVAS_ITEM_Z_MIN, 
			VisualServer.CANVAS_ITEM_Z_MAX
		) as int
	# Calculate the z-index with the y position
	else:
		z_index = clamp(
			floor_y, 
			VisualServer.CANVAS_ITEM_Z_MIN, 
			VisualServer.CANVAS_ITEM_Z_MAX
		) as int

#	# Calculate the z-index with the shadow's position
#	if has_node("ShadowOrigin/Shadow") and get_node("ShadowOrigin").visible:
#		var shadow = get_node("ShadowOrigin/Shadow")
#		var shadow_position = shadow.rect_global_position
#		var shadow_height   = shadow.rect_size.y
#
#		z_index = clamp(
#			shadow_position.y + shadow_height / 2, 
#			VisualServer.CANVAS_ITEM_Z_MIN, 
#			VisualServer.CANVAS_ITEM_Z_MAX
#		) as int
#
#	# If no shadow is found, calculate z_index with the sprite data
#	else:
#		# Calculate the z-index with the "floor" node's position
#		if !has_node("floor"):
#			z_index = clamp(
#				global_position.y + height, 
#				VisualServer.CANVAS_ITEM_Z_MIN, 
#				VisualServer.CANVAS_ITEM_Z_MAX
#			) as int
#		# Calculate the z-index with the y position
#		else:
#			z_index = clamp(
#				floor_y, 
#				VisualServer.CANVAS_ITEM_Z_MIN, 
#				VisualServer.CANVAS_ITEM_Z_MAX
#			) as int
