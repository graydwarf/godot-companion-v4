extends Node2D
@onready var _option3LineEdit = $ShaderControls/VBoxContainer/Option3Controls/HBoxContainer/Option3LineEdit
@onready var _option4LineEdit = $ShaderControls/VBoxContainer/Option4Controls/HBoxContainer/Option4LineEdit
@onready var _option5Button = $ShaderControls/VBoxContainer/Option5Controls/HBoxContainer/Option5Button
func UpdateProgress(value):
	$Sprite2D.material.set_shader_parameter("progress", value)

func UpdateStrength(value):
	$Sprite2D.material.set_shader_parameter("strength", value)

func ToggleAnimation():
	if _option5Button.text == "Start":
		$AnimationPlayer.play("Explode")
		_option5Button.text = "Stop"
	else:
		$AnimationPlayer.stop()
		_option5Button.text = "Start"
		
func _on_Option3Slider_value_changed(value):
	UpdateProgress(value)
	_option3LineEdit.text = str(value).pad_decimals(5)

func _on_Option3LineEdit_text_changed(new_text):
	UpdateStrength(new_text.to_float())

func _on_Option4HSlider_value_changed(value):
	UpdateStrength(value)
	_option4LineEdit.text = str(value).pad_decimals(5)

func _on_Option4LineEdit_text_changed(new_text):
	UpdateStrength(new_text.to_float())

func _on_Option5Button_pressed():
	ToggleAnimation()
