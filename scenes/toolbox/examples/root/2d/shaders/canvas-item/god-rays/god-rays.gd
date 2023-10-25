extends Node2D
@onready var _colorPickerContainer = $ColorPickerContainer
@onready var _option1LineEdit = $ShaderControls/VBoxContainer/Option1Controls/HBoxContainer/Option1LineEdit
@onready var _option2LineEdit = $ShaderControls/VBoxContainer/Option2Controls/HBoxContainer/Option2LineEdit
@onready var _option3LineEdit = $ShaderControls/VBoxContainer/Option3Controls/HBoxContainer/Option3LineEdit
@onready var _option4LineEdit = $ShaderControls/VBoxContainer/Option4Controls/HBoxContainer/Option4LineEdit
@onready var _option5LineEdit = $ShaderControls/VBoxContainer/Option5Controls/HBoxContainer/Option5LineEdit
@onready var _option6LineEdit = $ShaderControls/VBoxContainer/Option6Controls/HBoxContainer/Option6LineEdit
@onready var _option7LineEdit = $ShaderControls/VBoxContainer/Option7Controls/HBoxContainer/Option7LineEdit
@onready var _option8LineEdit = $ShaderControls/VBoxContainer/Option8Controls/HBoxContainer/Option8LineEdit
@onready var _option9LineEdit = $ShaderControls/VBoxContainer/Option9Controls/HBoxContainer/Option9LineEdit
@onready var _option10LineEdit = $ShaderControls/VBoxContainer/Option10Controls/HBoxContainer/Option10LineEdit
@onready var _option11LineEdit = $ShaderControls/VBoxContainer/Option11Controls/HBoxContainer/Option11LineEdit
@onready var _option12Checkbox = $ShaderControls/VBoxContainer/Option12Controls/HBoxContainer/Option12Checkbox
@onready var _option12LineEdit = $ShaderControls/VBoxContainer/Option12Controls/HBoxContainer/Option12LineEdit
@onready var _option13LineEdit = $ShaderControls/VBoxContainer/Option13Controls/HBoxContainer/Option13LineEdit

var _colorPickerTarget = ""
func _on_CloseButton_pressed():
	_colorPickerContainer.visible = false

func ShowColorPicker():
	_colorPickerContainer.visible = true
	
func UpdateShaderParam(paramName, value):
	$ColorRect.material.set_shader_parameter(paramName, value)
	
func _on_Option1Button_pressed():
	_colorPickerTarget = "Option1"
	ShowColorPicker()
	
func _on_ColorPicker_color_changed(color):
	var old_color_format = Vector4(color.r, color.g, color.b, color.a)
	_option11LineEdit.text = str(old_color_format)
	UpdateShaderParam("color", old_color_format)

func _on_Option1HSlider_value_changed(value):
	UpdateShaderParam("angle", value)
	_option1LineEdit.text = str(value)#.pad_decimals(2)

func _on_Option2HSlider_value_changed(value):
	UpdateShaderParam("position", value)
	_option2LineEdit.text = str(value)
	
func _on_Option3Slider_value_changed(value):
	UpdateShaderParam("spread", value)
	_option3LineEdit.text = str(value)
	
func _on_Option4HSlider_value_changed(value):
	UpdateShaderParam("cutoff", value)
	_option4LineEdit.text = str(value)

func _on_Option5HSlider_value_changed(value):
	UpdateShaderParam("falloff", value)
	_option5LineEdit.text = str(value)
	
func _on_Option6HSlider_value_changed(value):
	UpdateShaderParam("edge_fade", value)
	_option6LineEdit.text = str(value)

func _on_Option7HSlider_value_changed(value):
	UpdateShaderParam("speed", value)
	_option7LineEdit.text = str(value)

func _on_Option8HSlider_value_changed(value):
	UpdateShaderParam("ray1_density", value)
	_option8LineEdit.text = str(value)

func _on_Option9HSlider_value_changed(value):
	UpdateShaderParam("ray2_density", value)
	_option9LineEdit.text = str(value)

func _on_Option10HSlider_value_changed(value):
	UpdateShaderParam("ray2_intensity", value)
	_option10LineEdit.text = str(value)

func _on_Option11Button_pressed():
	ShowColorPicker()

func _on_Option12Checkbox_pressed():
	UpdateShaderParam("hdr", _option12Checkbox.button_pressed)
	_option12LineEdit.text = str(_option12Checkbox.button_pressed)
	
func _on_Option13HSlider_value_changed(value):
	UpdateShaderParam("seed", value)
	_option13LineEdit.text = str(value)
