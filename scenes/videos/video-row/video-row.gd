extends Control

@onready var _videoTitleLabel = $HBoxContainer/VideoTitleLabel
@onready var _rowBackground = $RowBackground
@onready var _dimensionTextureButton = $HBoxContainer/CenterContainer/HBoxContainer/DimensionTextureButton
@onready var _godotVersionTextureButton = $HBoxContainer/CenterContainer/HBoxContainer/GodotVersionTextureButton
@onready var _codeTypeTextureButton = $HBoxContainer/CenterContainer/HBoxContainer/CodeTypeTextureButton
@onready var _godotVersion3x = preload("res://assets/buttons-32x32/godot-version-3.x2.png")
@onready var _godotVersion4x = preload("res://assets/buttons-32x32/godot-version-4.x.png")
@onready var _dimension2d = preload("res://assets/buttons-32x32/dimension-2d2.png")
@onready var _dimension3d = preload("res://assets/buttons-32x32/dimension-3d2.png")
@onready var _codeTypeCSharp = preload("res://assets/buttons-32x32/code-type-csharp2.png")
@onready var _codeTypeGDScript = preload("res://assets/buttons-32x32/code-type-gdscript2.png")

var _index = -1

func _ready():
	Signals.connect("ResetVideoRowBackground", ResetVideoRowBackground)

func ResetVideoRowBackground():
	_rowBackground.color = Color(0.08, 0.08, 0.08, 1.0)
	
func ConfigureVideoRow(index, videoTitle, godotVersion, dimensions, codeType):
	_index = index
	_videoTitleLabel.text = videoTitle
	SetGodotVersion(godotVersion)
	SetDimension(dimensions)
	SetCodeType(codeType)

func SetGodotVersion(godotVersion):
	if godotVersion == "3.x":
		_godotVersionTextureButton.texture_normal = _godotVersion3x
		_godotVersionTextureButton.visible = true
	elif godotVersion == "4.x":
		_godotVersionTextureButton.texture_normal = _godotVersion4x
		_godotVersionTextureButton.visible = true

func SetDimension(dimensions):
	if dimensions == "2D":
		_dimensionTextureButton.texture_normal = _dimension2d
		_dimensionTextureButton.visible = true
	elif dimensions == "3D":
		_dimensionTextureButton.texture_normal = _dimension3d
		_dimensionTextureButton.visible = true

func SetCodeType(codeType):
	if codeType == "C#":
		_codeTypeTextureButton.texture_normal = _codeTypeCSharp
		_codeTypeTextureButton.visible = true
	elif codeType == "gd":
		_codeTypeTextureButton.texture_normal = _codeTypeGDScript
		_codeTypeTextureButton.visible = true
		
func _on_RowForeground_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		Signals.emit_signal("LaunchVideo", _index)
	elif event is InputEventMouseMotion:
		Signals.emit_signal("ResetVideoRowBackground")
		_rowBackground.color = Color(0.18, 0.18, 0.18, 1.0)

func _on_row_foreground_mouse_exited():
	_rowBackground.color = Color(0.08, 0.08, 0.08, 1.0)
