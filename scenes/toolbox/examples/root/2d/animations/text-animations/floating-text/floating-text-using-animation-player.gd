extends Node2D

@onready var _colorPickerContainer = $ColorPickerContainer
@onready var _textLineEdit = $ShaderControls/VBoxContainer/TextControls/HBoxContainer/TextLineEdit
@onready var _floatingTextContainer = $FloatingTextContainer
@onready var _fontColorLineEdit = $ShaderControls/VBoxContainer/FontColorControls/HBoxContainer/FontColorLineEdit
@onready var _floatingTextScene = preload("res://scenes/toolbox/examples/root/2d/animations/text-animations/floating-text/floating-text.tscn")
@onready var _fontSizeLineEdit = $ShaderControls/VBoxContainer/FontSizeControls/HBoxContainer/FontSizeLineEdit
@onready var _fontOutlineSizeLineEdit = $ShaderControls/VBoxContainer/FontOutlineSizeControls/HBoxContainer/FontOutlineSizeLineEdit
@onready var _fontOutlineColorLineEdit = $ShaderControls/VBoxContainer/FontOutlineColorControls/HBoxContainer/FontOutlineColorLineEdit
var _colorPickerTarget
var _fontColor = Color(1.0, 1.0, 1.0, 1.0)
var _fontOutlineColor = Color(0, 0, 0, 1.0)
var _fontOutlineSize = 0

func ShowColorPicker():
	_colorPickerContainer.visible = true

func UpdateFontColor(value):
	_fontColor = value

func GetFontSize():
	return str(_fontSizeLineEdit.text).to_int()

func GetOutlineSize():
	return str(_fontOutlineSizeLineEdit.text).to_int()
	
func GetFontColor():
	return _fontColor

func UpdateOutlineColor(color):
	_fontOutlineColor = color
	
func GetOutlineColor():
	return _fontOutlineColor
	
func GetText():
	return _textLineEdit.text
	
func CreateFloatingText(text, fontSize, fontColor, outlineSize, fontOutlineSizeColor):
	var floatingText = _floatingTextScene.instantiate()
	_floatingTextContainer.add_child(floatingText)
	floatingText.FloatText(text, fontSize, fontColor, outlineSize, fontOutlineSizeColor)

func _on_FontColorButton_pressed():
	_colorPickerTarget = "FontColor"
	ShowColorPicker()

func _on_AnimateTextTimer_timeout():
	CreateFloatingText(GetText(), GetFontSize(), GetFontColor(), GetOutlineSize(), GetOutlineColor())

func _on_ColorPicker_color_changed(color):
	if _colorPickerTarget == "FontColor":
		_fontColorLineEdit.text = str(color)
		UpdateFontColor(color)
	elif _colorPickerTarget == "OutlineColor":
		_fontOutlineColorLineEdit.text = str(color)
		UpdateOutlineColor(color)

func _on_FontSizeSlider_value_changed(value):
	_fontSizeLineEdit.text = str(value)
	
func _on_FontOutlineSizeSlider_value_changed(value):
	_fontOutlineSizeLineEdit.text = str(value)

func _on_FontOutlineColorButton_pressed():
	_colorPickerTarget = "OutlineColor"
	ShowColorPicker()

func _on_CloseButton_pressed():
	_colorPickerContainer.visible = false
