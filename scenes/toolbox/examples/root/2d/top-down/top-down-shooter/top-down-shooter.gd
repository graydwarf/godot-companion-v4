extends Node2D

@onready var _impactParticleScene = preload("res://scenes/toolbox/examples/root/2d/top-down/top-down-shooter/scenes/impact-particle/impact-particle.tscn")

func _ready():
	Signals.connect("BulletImpact", BulletImpact)

func BulletImpact(bulletLocation):
	var impactParticle = _impactParticleScene.instantiate()
	$ParticleCollection.add_child(impactParticle)
	impactParticle.global_position = bulletLocation
