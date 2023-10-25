extends Node2D

var _bullet = preload("res://scenes/toolbox/examples/root/2d/top-down/top-down-shooter/scenes/bullets/basic-bullet.tscn")
var _smoke1 = preload("res://scenes/toolbox/examples/root/2d/top-down/top-down-shooter/scenes/turret/smoke1.tscn")
var _smoke2 = preload("res://scenes/toolbox/examples/root/2d/top-down/top-down-shooter/scenes/turret/smoke2.tscn")
var _bulletSpeed = 2000

func _ready():
	var gunBarrelNum = Common.Rand(1, 2)
	var icon = load("res://scenes/toolbox/examples/root/2d/top-down/top-down-shooter/assets/turret/GunBarrel" + str(gunBarrelNum) + ".png")
	$Sprite2D.set_texture(icon)

func Shoot(turretRotation):
	var bulletInstance = _bullet.instantiate()
	bulletInstance.position = position
	bulletInstance.position.x += 4
	bulletInstance.apply_impulse(Vector2(_bulletSpeed, 0).rotated(turretRotation), Vector2())
	call_deferred("add_child", bulletInstance)
	Bang()
	Kick()
	Smoke1(turretRotation)

func Bang():
	# TODO: Add sound
	$AudioStreamPlayer.play()
	
func Kick():
	$AnimationPlayer.play("Kick")
	
func Smoke1(turretRotation):
	var smoke = _smoke1.instantiate()
	smoke.global_position = global_position
	smoke.rotation = turretRotation
	get_tree().get_root().call_deferred("add_child", smoke)
	smoke.Play()

func Smoke2(turretRotation):
	var smoke = _smoke2.instantiate()
	smoke.global_position = global_position
	smoke.rotation = turretRotation
	get_tree().get_root().call_deferred("add_child", smoke)
	smoke.Play()
