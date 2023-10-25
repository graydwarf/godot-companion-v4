extends Node2D

func _on_HSlider_value_changed(value):
	for thruster in $ThusterContainer.get_children():
		thruster.AdjustThrust(value)

func StartThrusters():
	for thruster in $ThusterContainer.get_children():
		thruster.StartThruster()

func StopThrusters():
	for thruster in $ThusterContainer.get_children():
		thruster.StopThruster()
	
func _physics_process(_delta):	
	if Input.is_action_pressed("ui_up"):
		StartThrusters()
	elif Input.is_action_just_released("ui_up"):
		StopThrusters()
