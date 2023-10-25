extends CharacterBody2D

var _moveSpeed = 500


func _physics_process(_delta):
	var motion = Vector2()
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_cancel"):
		set_physics_process(false)
		Signals.emit_signal("CancelExample")
		return
		
	motion = motion.normalized()
	set_velocity(motion * _moveSpeed)
	move_and_slide()
	motion = velocity

	look_at(get_global_mouse_position())

