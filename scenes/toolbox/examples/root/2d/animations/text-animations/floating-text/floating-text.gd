extends Node2D

func FloatText(text, fontSize = 12, fontColor = Color(1.0, 1.0, 1.0, 1.0), outlineSize = 0, outlineColor = Color(0, 0, 0, 1.0)):
	$TextLabel.text = text
	$TextLabel.label_settings.font_size = fontSize
	$TextLabel.label_settings.font_color = fontColor
	$TextLabel.label_settings.outline_size = outlineSize
	$TextLabel.label_settings.outline_color = outlineColor
	$AnimationPlayer.play("FloatUp")
	
func Cleanup():
	queue_free()

func _on_AnimationPlayer_animation_finished(__anim_name):
	Cleanup()
