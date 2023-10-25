extends Node2D

@onready var _blueControl = $GreenControl/BlueControl
@onready var _redControl = $GreenControl/RedControl
@onready var _greenControl = $GreenControl

var _isDraggingBlueControl = false
var _isDraggingRedControl = false
var _isDraggingGreenControl = false

var _localMousePosition = Vector2(0,0)

func _ready():
	pass # Replace with function body.
	set_process_unhandled_input(false)

func _process(_delta):
	var globalMousePosition = get_global_mouse_position()
	if _isDraggingBlueControl:
		_blueControl.global_position = globalMousePosition - _localMousePosition
	if _isDraggingRedControl:
		_redControl.global_position = globalMousePosition
	if _isDraggingGreenControl:
		_greenControl.global_position = globalMousePosition - _localMousePosition

func _on_RedControl_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		_isDraggingRedControl = true
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		_isDraggingRedControl = false

func _on_BlueControl_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		_localMousePosition = _blueControl.get_local_mouse_position()
		_isDraggingBlueControl = true
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		_isDraggingBlueControl = false

func _on_GreenControl_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		_localMousePosition = _greenControl.get_local_mouse_position()
		_isDraggingGreenControl = true
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		_isDraggingGreenControl = false
