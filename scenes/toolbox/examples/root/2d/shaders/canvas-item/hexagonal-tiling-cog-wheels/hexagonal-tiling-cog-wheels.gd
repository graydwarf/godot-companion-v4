extends Node2D
@onready var _colorPickerContainer = $ColorPickerContainer
@onready var _option1LineEdit = $ShaderControls/VBoxContainer/Option1Controls/HBoxContainer/Option1LineEdit
@onready var _option2LineEdit = $ShaderControls/VBoxContainer/Option2Controls/HBoxContainer/Option2LineEdit
@onready var _option3LineEdit = $ShaderControls/VBoxContainer/Option3Controls/HBoxContainer/Option3LineEdit
@onready var _option4LineEdit = $ShaderControls/VBoxContainer/Option4Controls/HBoxContainer/Option4LineEdit
@onready var _option5LineEdit = $ShaderControls/VBoxContainer/Option5Controls/HBoxContainer/Option5LineEdit
@onready var _option6LineEdit = $ShaderControls/VBoxContainer/Option6Controls/HBoxContainer/Option6LineEdit

var _localMousePosition
var _isDraggingControl = false

func _process(_delta):
	if _isDraggingControl:
		$ColorRect.global_position = get_global_mouse_position() - _localMousePosition
		
var _colorPickerTarget = ""
func _on_CloseButton_pressed():
	_colorPickerContainer.visible = false

func ShowColorPicker():
	_colorPickerContainer.visible = true
	
func UpdateBackColor(value):
	$ColorRect.material.set_shader_parameter("back_color", value)

func UpdateGearColor(value):
	$ColorRect.material.set_shader_parameter("gears_color", value)

func UpdateBaseZoom(value):
	$ColorRect.material.set_shader_parameter("base_zoom", value)

func UpdateZoomSpeed(value):
	$ColorRect.material.set_shader_parameter("zoomSpeed", value)

func UpdateGearSpeed(value):
	$ColorRect.material.set_shader_parameter("GearSpeed", value)

func UpdateClockSpeed(value):
	$ColorRect.material.set_shader_parameter("ClockSpeed", value)
	
func UpdateAngle(value):
	$ColorRect.material.set_shader_parameter("angle", value)
	
func _on_Option1Button_pressed():
	_colorPickerTarget = "Option1"
	ShowColorPicker()
	
func _on_ColorPicker_color_changed(color):
	if _colorPickerTarget == "Option1":
		_option1LineEdit.text = str(color)
		UpdateBackColor(color)
	elif _colorPickerTarget == "Option2":
		_option2LineEdit.text = str(color)
		UpdateGearColor(color)

func _on_Option2Button_pressed():
	_colorPickerTarget = "Option2"
	ShowColorPicker()

func _on_Option2LineEdit_text_changed(new_text):
	UpdateBackColor(Color(new_text))

func _on_Option3Slider_value_changed(value):
	UpdateZoomSpeed(value)
	_option3LineEdit.text = str(value)

func _on_Option3LineEdit_text_changed(new_text):
	UpdateGearSpeed(new_text.to_float())

func _on_Option4HSlider_value_changed(value):
	UpdateZoomSpeed(value)
	_option4LineEdit.text = str(value)

func _on_Option4LineEdit_text_changed(new_text):
	UpdateZoomSpeed(new_text.to_float())

func _on_Option5HSlider_value_changed(value):
	UpdateGearSpeed(value)
	_option5LineEdit.text = str(value).pad_decimals(2)

func _on_Option5LineEdit_text_changed(new_text):
	UpdateClockSpeed(new_text.to_float())

func _on_Option6HSlider_value_changed(value):
	UpdateClockSpeed(value)
	_option6LineEdit.text = str(value).pad_decimals(2)

func _on_Option6LineEdit_text_changed(new_text):
	UpdateAngle(new_text.to_int())

func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		_localMousePosition = $ColorRect.get_local_mouse_position()
		_isDraggingControl = true
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		_localMousePosition = $ColorRect.get_local_mouse_position()
		_isDraggingControl = false
