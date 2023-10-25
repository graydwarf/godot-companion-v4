extends Control

var _draggingNode : DraggableNode

func _ready():
	Signals.connect("StartDraggingNode", StartDraggingNode)
	Signals.connect("DoneDraggingNode", DoneDraggingNode)
	set_process_unhandled_input(true)

func StartDraggingNode(draggableNode : DraggableNode):
	_draggingNode = draggableNode

func DoneDraggingNode():
	_draggingNode = null

# This is where we catch invalid drops
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if _draggingNode:
			# Restore the original
			_draggingNode.visible = true
		DoneDraggingNode()

func _on_RestartButton_pressed():
	Signals.emit_signal("LoadExampleData")

func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		pass
