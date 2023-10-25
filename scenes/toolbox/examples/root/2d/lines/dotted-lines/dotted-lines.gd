extends Node2D

@onready var _dotScene = preload("res://scenes/toolbox/examples/root/2d/lines/dotted-lines/scenes/dot/dot.tscn")

func CreateDotAtPosition(mousePosition):
	$Line2D.add_point(mousePosition)

func Reset():
	$Line2D.clear_points()
	$Line2D.add_point(Vector2(144, 92))
		
func _on_Button_pressed():
	Reset()

func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		CreateDotAtPosition(event.position)
