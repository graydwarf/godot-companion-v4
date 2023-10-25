extends Control

@export var _dropType : String = ""

#@onready var _textureButton = $CenterContainer/TextureButton
@onready var _particles = $ParticleContainer/GPUParticles2D
@onready var _particleTimer = $TimerContainer/ParticleTimer

func _ready():
	#_textureButton.texture_normal = load("res://assets/shapes/" + _dropType + "-128x128.png")
	set_process_unhandled_input(true)
	
func ConfigureDropZone(dropType : String):
	_dropType = dropType
	
func _can_drop_data(_position, data):	
	if data.size() == 0:
		return false
		
	if !data.has("DraggableNode"):
		return false

	var draggableNode : DraggableNode = data["DraggableNode"]
	
	if _dropType != draggableNode.GetDropType():
		return false
	
	return true

func _drop_data(_position: Vector2, data):
	if !data.has("DraggableNode"):
		return false
	
	# Get the DraggableNode back out of the dictionary
	var draggableNode = data["DraggableNode"]
	
	# Get what I need from the original node here and 
	# then clean it up unless I'm moving it or using it.
	draggableNode.queue_free()
	
	Signals.emit_signal("DoneDraggingNode")
	
	StartFireworks()

# This is where we catch invalid drops
func _unhandled_input(_event):
	pass
#	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
#		if _draggingNode:
#			# Restore the original
#			_draggingNode.visible = true
#		DoneDraggingNode()
		
func StartFireworks():
	_particles.emitting = true
	_particleTimer.start()
	
func _on_ParticleTimer_timeout():
	_particles.emitting = false
