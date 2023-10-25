extends Node2D
@onready var _colorPickerContainer = $ColorPickerContainer
@onready var _scaleXLineEdit = $ShaderControls/VBoxContainer/ScaleXControls/HBoxContainer/ScaleXLineEdit
@onready var _scaleYLineEdit = $ShaderControls/VBoxContainer/ScaleYControls/HBoxContainer/ScaleYLineEdit
@onready var _scaleXYLineEdit = $ShaderControls/VBoxContainer/ScaleXYControls/HBoxContainer/ScaleXYLineEdit
@onready var _colorLineEdit = $ShaderControls/VBoxContainer/ColorControls/HBoxContainer/ColorLineEdit
@onready var _scaleXSlider = $ShaderControls/VBoxContainer/ScaleXControls/HBoxContainer/ScaleXSlider
@onready var _scaleYSlider = $ShaderControls/VBoxContainer/ScaleYControls/HBoxContainer/ScaleYSlider

func ShowColorPicker():
	_colorPickerContainer.visible = true
	
func UpdateColor(value):
	$Sprite2D.material.set_shader_parameter("color", value)

func UpdateScale(value):
	$Sprite2D.material.set_shader_parameter("scale", Vector2(value, value))
	_scaleXSlider.value = value
	_scaleYSlider.value = value
	
func UpdateScaleX(value):
	var scaleVector = $Sprite2D.material.get_shader_parameter("scale")
	$Sprite2D.material.set_shader_parameter("scale", Vector2(value, scaleVector.y))

func UpdateScaleY(value):
	var scaleVector = $Sprite2D.material.get_shader_parameter("scale")
	$Sprite2D.material.set_shader_parameter("scale", Vector2(scaleVector.x, value))
	
func _on_ColorPicker_color_changed(color):
	_colorLineEdit.text = str(color)
	UpdateColor(color)

func _on_ColorButton_pressed():
	ShowColorPicker()

func _on_CloseButton_pressed():
	_colorPickerContainer.visible = false

func _on_ColorLineEdit_text_changed(new_text):
	UpdateColor(new_text)

func _on_ScaleXSlider_value_changed(value):
	UpdateScaleX(value)
	_scaleXLineEdit.text = str(value)

func _on_ScaleXLineEdit_text_changed(new_text):
	UpdateScaleX(new_text.to_int())

func _on_ScaleYLineEdit_text_changed(new_text):
	UpdateScaleY(new_text.to_int())

func _on_ScaleYSlider_value_changed(value):
	UpdateScaleY(value)
	_scaleYLineEdit.text = str(value)

func _on_ScaleXYSlider_value_changed(value):
	UpdateScale(value)
	_scaleXYLineEdit.text = str(value)

func _on_ScaleXYLineEdit_text_changed(new_text):
	UpdateScale(new_text.to_int())
