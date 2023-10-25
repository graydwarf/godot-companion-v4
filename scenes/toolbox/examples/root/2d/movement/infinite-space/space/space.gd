extends ParallaxBackground

@onready var _parallaxLayer1 = $ParallaxLayer1 # The stars
@onready var _parallaxLayer1Sprite = $ParallaxLayer1/SpaceBackgroundSprite
#
# Notes: parallaxLayer2 is the planets. They are statically positioned but infinite 
# as well. Try to find all three. To speed things up, increase player speed
# or reduce ParallaxLayer2 Mirroring or adjust the position of any given planet
# so it's closer to your starting position.
#

func _ready():
	#Signals.emit_signal("HideGodotCompanionUI")
	_parallaxLayer1.motion_mirroring = _parallaxLayer1Sprite.texture.get_size().rotated(_parallaxLayer1Sprite.global_rotation)
