extends Node2D

func UpdateRadians(value):
	$Sprite2D.material.set_shader_parameter("value", value)

func UpdateQuality(value):
	$Sprite2D.material.set_shader_parameter("quality", value)

func UpdateScaleValue(value):
	$Sprite2D.material.set_shader_parameter("scale_value", value)

func UpdateOccilationSpeed(value):
	$Sprite2D.material.set_shader_parameter("occilation_speed", value)

func UpdateXOffsetValue(value):
	$Sprite2D.material.set_shader_parameter("xOffset", value)

func UpdateYOffsetValue(value):
	$Sprite2D.material.set_shader_parameter("yOffset", value)
		
func _on_RadiansHSlider_value_changed(value):
	$ShaderControls/VBoxContainer/RadianControls/HBoxContainer/RadiansLineEdit.text = str(value).pad_decimals(1)
	UpdateRadians(value)

func _on_RadiansLineEdit_text_changed(textValue):
	var f = textValue.to_float()
	UpdateRadians(f)

func _on_QualityHSlider_value_changed(value):
	$ShaderControls/VBoxContainer/QualityControls/HBoxContainer/QualityLineEdit.text = str(value)
	UpdateQuality(value)

func _on_QualityLineEdit_text_changed(textValue):
	var f = textValue.to_float()
	UpdateRadians(f)

func _on_OccilationHSlider_value_changed(value):
	$ShaderControls/VBoxContainer/OccilationSpeedControls/HBoxContainer/OccilationLineEdit.text = str(value).pad_decimals(1)
	UpdateOccilationSpeed(value)

func _on_OccilationLineEdit_text_changed(textValue):
	var f = textValue.to_float()
	UpdateOccilationSpeed(f)

func _on_ScaleValueHSlider_value_changed(value):
	$ShaderControls/VBoxContainer/ScaleValueControls/HBoxContainer/ScaleValueLineEdit.text = str(value).pad_decimals(2)
	UpdateScaleValue(value)

func _on_ScaleValueLineEdit_text_changed(textValue):
	var f = textValue.to_float()
	UpdateScaleValue(f)

func _on_XOffsetHSlider_value_changed(value):
	$ShaderControls/VBoxContainer/XOffsetControls/HBoxContainer/XOffsetLineEdit.text = str(value).pad_decimals(5)
	UpdateXOffsetValue(value)

func _on_XOffsetLineEdit_text_changed(textValue):
	var f = textValue.to_float()
	UpdateXOffsetValue(f)
	
func _on_YOffsetHSlider_value_changed(value):
	$ShaderControls/VBoxContainer/YOffsetControls/HBoxContainer/YOffsetLineEdit.text = str(value).pad_decimals(5)
	UpdateYOffsetValue(value)

func _on_YOffsetLineEdit_text_changed(textValue):
	var f = textValue.to_float()
	UpdateYOffsetValue(f)
