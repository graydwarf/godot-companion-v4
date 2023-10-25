extends Button
class_name TagNode

var _fontColor

func SetText(t):
	self.text = t
	_fontColor = self.get_theme_color("font_color", "Button")

func _on_TagNode_pressed() -> void:
	Signals.emit_signal("TagClicked", self)

