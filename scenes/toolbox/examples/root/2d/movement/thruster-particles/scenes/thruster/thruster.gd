extends Area2D
class_name Thruster

@onready var _thrustParticles2D = $ThrustParticles2D

func StartThruster():
	_thrustParticles2D.emitting = true

func StopThruster():
	_thrustParticles2D.emitting = false
	
func _physics_process(_delta):	
	look_at(get_global_mouse_position())
	
func AdjustThrust(amount):
	_thrustParticles2D.amount = amount
	_thrustParticles2D.lifetime = round(amount /  4)
