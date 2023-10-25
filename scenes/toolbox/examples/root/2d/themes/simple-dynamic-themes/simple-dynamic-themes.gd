extends Control

@onready var _outputLabel = $MarginContainer/VBoxContainer/MarginContainer/OutputLabel

func LoadTheme(themeNumber):
	theme = load("res://scenes/toolbox/examples/root/2d/themes/simple-dynamic-themes/example-themes/theme-" + str(themeNumber) + ".tres")
	_outputLabel.text = "Current Theme: theme-" + themeNumber
	
func _on_ThemeButton1_pressed():
	LoadTheme("1")

func _on_ThemeButton2_pressed():
	LoadTheme("2")

func _on_ThemeButton4_pressed():
	theme = null
	_outputLabel.text = "Current Theme: none"
