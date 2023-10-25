extends Node2D

func _ready():
	$GPUParticles2D.emitting = true
	
func Cleanup():
	queue_free()

func _on_CleanupTimer_timeout():
	Cleanup()
