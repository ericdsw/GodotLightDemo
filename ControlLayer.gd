extends CanvasLayer

#var properties = DayTimeProperties.new(Color("#808080"), 1.0, 1.0, 0.0, 0.0, 1.00, 0.0)
var properties = DayTimeProperties.new(Color("#0f3abc"), 0.3, 1.0, -0.40, 0.70, 0.75, 1.2)

var night = DayTimeProperties.new(Color("#0f3abc"), 0.3, 1.0, -0.40, 0.70, 0.75, 1.2)
var dawn = DayTimeProperties.new(Color("#b79c4d"), 0.85, 0.95, -0.45, 0.1, 1.00, 0.8)
var dusk = DayTimeProperties.new(Color("#b79c4d"), 0.85, 0.95, -0.45, 0.1, 1.00, 0.8)
var day = DayTimeProperties.new(Color("#808080"), 1.0, 1.0, 0.0, 0.0, 1.00, 0.0)

#var night_2 = DayTimeProperties.new(Color("#5050b9"), 0.8, 0.7, -0.30, 0.20, 0.70, 0.7)

onready var container = get_node("VBoxContainer")
onready var preset_button = container.get_node("PresetButton")
onready var color_button = container.get_node("HBoxContainer/ColorPickerButton")
onready var light_color_button = container.get_node("HBoxContainer8/ColorPickerButton")

# Text Fields
onready var color_field = get_node("VBoxContainer/HBoxContainer/LineEdit")
onready var contrast_field = get_node("VBoxContainer/HBoxContainer2/LineEdit")
onready var saturation_field = get_node("VBoxContainer/HBoxContainer3/LineEdit")
onready var brightness_field = get_node("VBoxContainer/HBoxContainer4/LineEdit")
onready var pop_strength_field = get_node("VBoxContainer/HBoxContainer5/LineEdit")
onready var pop_threshold_field = get_node("VBoxContainer/HBoxContainer6/LineEdit")
onready var light_strength_field = get_node("VBoxContainer/HBoxContainer7/LineEdit")
onready var light_color_field = get_node("VBoxContainer/HBoxContainer8/LineEdit")

func _ready() -> void:
	
	# Hide by default
	_on_CheckBox_toggled(false)
	
	# Populate preset button
	preset_button.get_popup().add_item("Dawn", 0)
	preset_button.get_popup().add_item("Daytime", 1)
	preset_button.get_popup().add_item("Dusk", 2)
	preset_button.get_popup().add_item("Night", 3)
	
	preset_button.get_popup().connect("id_pressed", self, "_on_preset_selected")
	
	properties.connect("property_updated", self, "_on_property_updated")
	color_button.connect("color_changed", self, "_on_color_picker_changed")
	light_color_button.connect("color_changed", self, "_on_light_color_picker_changed")
	
	_on_property_updated()

#func _on_LineEdit_text_changed(new_text: String, input_name: String) -> void:
func _on_input_changed(new_text: String, input_name: String) -> void:
	match input_name:
		"color":
			properties.filter_color = Color(new_text)
		"contrast":
			properties.contrast = float(new_text)
		"saturation":
			properties.saturation = float(new_text)
		"brightness":
			properties.brightness = float(new_text)
		"pop_strength":
			properties.pop_strength = float(new_text)
		"pop_threshold":
			properties.pop_threshold = float(new_text)
		"light_strength":
			properties.light_strength = float(new_text)
		"light_color":
			properties.light_color = Color(new_text)

func _on_CheckBox_toggled(button_pressed: bool) -> void:
	var player = get_node("../Elements/player")
	if player != null:
		player.movement_enabled = !button_pressed
	if !button_pressed:
		container.hide()
	else:
		container.show()

func _on_property_updated() -> void:
	
	var filter = get_node("../FilterZCalculator/DayNightFilter")
	if filter != null:
		filter.apply_properties(properties)
	
	color_button.color = properties.filter_color
	color_field.text = properties.filter_color.to_html(false)
	contrast_field.text = str(properties.contrast)
	saturation_field.text = str(properties.saturation)
	brightness_field.text = str(properties.brightness)
	pop_strength_field.text = str(properties.pop_strength)
	pop_threshold_field.text = str(properties.pop_threshold)
	light_strength_field.text = str(properties.light_strength)
	light_color_field.text = properties.light_color.to_html(false)
	light_color_button.color = properties.light_color

func _on_preset_selected(id: int) -> void:
	match id:
		0:
			properties.update_from_property(dawn)
		1:
			properties.update_from_property(day)
		2:
			properties.update_from_property(dusk)
		3:
			properties.update_from_property(night)

func _on_color_picker_changed(new_color: Color) -> void:
	properties.filter_color = new_color

func _on_light_color_picker_changed(new_color: Color) -> void:
	properties.light_color = new_color
