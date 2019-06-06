extends Node
class_name DayTimeProperties

signal property_updated()

var filter_color : Color setget _set_filter_color, _get_filter_color
var contrast : float setget _set_contrast, _get_contrast
var saturation : float setget _set_saturation, _get_saturation
var brightness : float setget _set_brightness, _get_brightness
var pop_strength : float setget _set_pop_strength, _get_pop_strength
var pop_threshold : float setget _set_pop_threshold, _get_pop_threshold
var light_strength : float setget _set_light_strength, _get_light_strength

func _init(
		_filter_color: Color, _contrast: float, _saturation: float, 
		_brightness: float, _pop_strength: float, _pop_threshold: float,
		_light_strength: float
	) -> void:
	
	filter_color = _filter_color
	contrast = _contrast
	saturation = _saturation
	brightness = _brightness
	pop_strength = _pop_strength
	pop_threshold = _pop_threshold
	light_strength = _light_strength

func update_from_property(property: DayTimeProperties) -> void:
	filter_color = property.filter_color
	contrast = property.contrast
	saturation = property.saturation
	brightness = property.brightness
	pop_strength = property.pop_strength
	pop_threshold = property.pop_threshold
	light_strength = property.light_strength
	emit_signal("property_updated")

func _set_filter_color(_filter_color: Color) -> void:
	filter_color = _filter_color
	emit_signal("property_updated")

func _set_contrast(_contrast: float) -> void:
	contrast = _contrast
	emit_signal("property_updated")

func _set_saturation(_saturation: float) -> void:
	saturation = _saturation
	emit_signal("property_updated")

func _set_brightness(_brightness: float) -> void:
	brightness = _brightness
	emit_signal("property_updated")

func _set_pop_strength(_pop_strength: float) -> void:
	pop_strength = _pop_strength
	emit_signal("property_updated")

func _set_pop_threshold(_pop_threshold: float) -> void:
	pop_threshold = _pop_threshold
	emit_signal("property_updated")

func _set_light_strength(_light_strength: float) -> void:
	light_strength = _light_strength
	emit_signal("property_updated")

func _get_filter_color() -> Color: 
	return filter_color

func _get_contrast() -> float:
	return contrast

func _get_saturation() -> float:
	return saturation

func _get_brightness() -> float:
	return brightness

func _get_pop_strength() -> float:
	return pop_strength

func _get_pop_threshold() -> float:
	return pop_threshold

func _get_light_strength() -> float:
	return light_strength
