extends Node2D
@onready var _option3LineEdit = $ShaderControls/VBoxContainer/Option3Controls/HBoxContainer/Option3LineEdit

func UpdateIResolution(value):
	$Sprite2D.material.set_shader_parameter("iResolution", Vector2(value, 1))

func _on_Option3Slider_value_changed(value):
	UpdateIResolution(value)
	_option3LineEdit.text = str(value).pad_decimals(5)

func _on_Option3LineEdit_text_changed(new_text):
	UpdateIResolution(new_text.to_float())

