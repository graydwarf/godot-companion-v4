extends Control
class_name DraggableNode

@onready var _textureButton = $CenterContainer/TextureButton
@export var _nodeType : String = "triangle"

func _ready():
	_textureButton.texture_normal  = load("res://assets/shapes/" + _nodeType + "-128x128.png")
	set_process_unhandled_input(true)
	
func GetDropType():
	return _nodeType

func RestoreNode():
	visible = true

func _get_drag_data(_position : Vector2):
	# Store self in a dictionary
	var data = {}
	data["DraggableNode"] = self
	
	# Duplicate myself for the preview
	var draggableNode = self.duplicate()
	
	# Create a temporary drag preview control that will free itself 
	var dragPreview = Control.new()

	# Add our duped self. You can use any scene as the preview. You don't
	# have to duplicate and in some cases, that can be problematic. If duplicate
	# is giving you a hard time, create an all new node of this type or a spoof one.
	# Only has to look like your node.
	dragPreview.add_child(draggableNode)
	
	# Tweak the preview so it's centered on our mouse and partially opaque.
	draggableNode.position = -0.5 * draggableNode.size
	draggableNode.modulate = Color(1.0, 1.0, 1.0, 0.3)
	
	set_drag_preview(dragPreview)
	
	# Couple ways to do this depending on your needs. You can remove
	# it from the scene tree and store it temporarily or you can hide it.
	# Hiding is easier because we can easily restore it by making it 
	# visible again in-case the user cancels or makes an invalid drop.
	#visible = false
	
	Signals.emit_signal("StartDraggingNode", self)
	return data

func _unhandled_input(_event):
	pass
	
func _on_texture_button_button_up():
	pass # Replace with function body.


func _on_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		pass
