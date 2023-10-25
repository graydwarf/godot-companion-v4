extends Node2D
@onready var _colorPickerContainer = $ColorPickerContainer
@onready var _option1LineEdit = $ShaderControls/VBoxContainer/Option1Controls/HBoxContainer/Option1LineEdit
@onready var _option2LineEdit = $ShaderControls/VBoxContainer/Option2Controls/HBoxContainer/Option2LineEdit
@onready var _option3LineEdit = $ShaderControls/VBoxContainer/Option3Controls/HBoxContainer/Option3LineEdit
@onready var _option4LineEdit = $ShaderControls/VBoxContainer/Option4Controls/HBoxContainer/Option4LineEdit
@onready var _option5LineEdit = $ShaderControls/VBoxContainer/Option5Controls/HBoxContainer/Option5LineEdit
@onready var _option6LineEdit = $ShaderControls/VBoxContainer/Option6Controls/HBoxContainer/Option6LineEdit

var _colorPickerTarget = ""
func _on_CloseButton_pressed():
	_colorPickerContainer.visible = false

func ShowColorPicker():
	_colorPickerContainer.visible = true
	
func UpdateGapColor(value):
	$Sprite2D.material.set_shader_parameter("color_gap", value)

func UpdateColorStripe(value):
	$Sprite2D.material.set_shader_parameter("color_stripe", value)

func UpdateDivisions(value):
	$Sprite2D.material.set_shader_parameter("divisions", value)

func UpdateStripeBias(value):
	$Sprite2D.material.set_shader_parameter("stripe_bias", value)

func UpdateSpeed(value):
	$Sprite2D.material.set_shader_parameter("speed", value)

func UpdateAngle(value):
	$Sprite2D.material.set_shader_parameter("angle", value)
	
func _on_Option1Button_pressed():
	_colorPickerTarget = "Option1"
	ShowColorPicker()
	
func _on_ColorPicker_color_changed(color):
	if _colorPickerTarget == "Option1":
		_option1LineEdit.text = str(color)
		UpdateGapColor(color)
	elif _colorPickerTarget == "Option2":
		_option2LineEdit.text = str(color)
		UpdateColorStripe(color)

func _on_Option2Button_pressed():
	_colorPickerTarget = "Option2"
	ShowColorPicker()

func _on_Option2LineEdit_text_changed(new_text):
	UpdateColorStripe(Color(new_text))

func _on_Option3Slider_value_changed(value):
	UpdateDivisions(value)
	_option3LineEdit.text = str(value)

func _on_Option3LineEdit_text_changed(new_text):
	UpdateDivisions(new_text.to_int())

func _on_Option4HSlider_value_changed(value):
	UpdateStripeBias(value)
	_option4LineEdit.text = str(value)

func _on_Option4LineEdit_text_changed(new_text):
	UpdateStripeBias(new_text.to_int())

func _on_Option5HSlider_value_changed(value):
	UpdateSpeed(value)
	_option5LineEdit.text = str(value).pad_decimals(2)

func _on_Option5LineEdit_text_changed(new_text):
	UpdateSpeed(new_text.to_int())

func _on_Option6HSlider_value_changed(value):
	UpdateAngle(value)
	_option6LineEdit.text = str(value).pad_decimals(5)

func _on_Option6LineEdit_text_changed(new_text):
	UpdateAngle(new_text.to_int())
