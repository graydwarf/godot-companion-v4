extends PanelContainer
@onready var _colorRect = $HSplitContainer/VSplitContainer/PanelContainer/ColorRect
@onready var _option0Checkbox = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option0Controls/HBoxContainer/Option0Checkbox
@onready var _option0LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option0Controls/HBoxContainer/Option0LineEdit
@onready var _option1Checkbox = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option1Controls/HBoxContainer/Option1Checkbox
@onready var _option1LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option1Controls/HBoxContainer/Option1LineEdit
@onready var _option2LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option2Controls/HBoxContainer/Option2LineEdit
@onready var _option2HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option2Controls/HBoxContainer/Option2HSlider
@onready var _option3LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option3Controls/HBoxContainer/Option3LineEdit
@onready var _option3HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option3Controls/HBoxContainer/Option3HSlider
@onready var _option5LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option5Controls/HBoxContainer/Option5LineEdit
@onready var _option5HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option5Controls/HBoxContainer/Option5HSlider
@onready var _option7Checkbox = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option7Controls/HBoxContainer/Option7Checkbox
@onready var _option7LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option7Controls/HBoxContainer/Option7LineEdit
@onready var _option8Checkbox = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option8Controls/HBoxContainer/Option8Checkbox
@onready var _option8LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option8Controls/HBoxContainer/Option8LineEdit
@onready var _option9LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option9Controls/HBoxContainer/Option9LineEdit
@onready var _option9HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option9Controls/HBoxContainer/Option9HSlider
@onready var _option10LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option10Controls/HBoxContainer/Option10LineEdit
@onready var _option10HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option10Controls/HBoxContainer/Option10HSlider
@onready var _option11LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option11Controls/HBoxContainer/Option11LineEdit
@onready var _option11HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option11Controls/HBoxContainer/Option11HSlider
@onready var _option14LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option14Controls/HBoxContainer/Option14LineEdit
@onready var _option14HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option14Controls/HBoxContainer/Option14HSlider
@onready var _option15LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option15Controls/HBoxContainer/Option15LineEdit
@onready var _option15HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option15Controls/HBoxContainer/Option15HSlider
@onready var _option16LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option16Controls/HBoxContainer/Option16LineEdit
@onready var _option16HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option16Controls/HBoxContainer/Option16HSlider
@onready var _option17LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option17Controls/HBoxContainer/Option17LineEdit
@onready var _option17HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option17Controls/HBoxContainer/Option17HSlider
@onready var _option18LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option18Controls/HBoxContainer/Option18LineEdit
@onready var _option18HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option18Controls/HBoxContainer/Option18HSlider
@onready var _option19LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option19Controls/HBoxContainer/Option19LineEdit
@onready var _option19HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option19Controls/HBoxContainer/Option19HSlider
@onready var _option20LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option20Controls/HBoxContainer/Option20LineEdit
@onready var _option21LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option21Controls/HBoxContainer/Option21LineEdit
@onready var _option21HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option21Controls/HBoxContainer/Option21HSlider
@onready var _option22LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option22Controls/HBoxContainer/Option22LineEdit
@onready var _option22Checkbox = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option22Controls/HBoxContainer/Option22Checkbox
@onready var _option23LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option23Controls/HBoxContainer/Option23LineEdit
@onready var _option23HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option23Controls/HBoxContainer/Option23HSlider
@onready var _option20Checkbox = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option20Controls/HBoxContainer/Option20Checkbox
@onready var _option24LineEdit = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option24Controls/HBoxContainer/Option24LineEdit
@onready var _option24HSlider = $HSplitContainer/MarginContainer/ShaderControls/ScrollContainer/VBoxContainer/Option24Controls/HBoxContainer/Option24HSlider

func _ready():
	InitShader()

func InitShader():
	UpdateShaderParam("overlay", _option1Checkbox.button_pressed)
	_option1LineEdit.text = str(_option1Checkbox.button_pressed)
	
	UpdateShaderParam("scanlines_opacity", _option2HSlider.value)
	_option2LineEdit.text = str(_option2HSlider.value)

	UpdateShaderParam("scanlines_width", _option3HSlider.value)
	_option3LineEdit.text = str(_option3HSlider.value)
		
	UpdateShaderParam("grille_opacity", _option5HSlider.value)
	_option5LineEdit.text = str(_option5HSlider.value)

	UpdateShaderParam("pixelate", _option7Checkbox.button_pressed)
	_option7LineEdit.text = str(_option7Checkbox.button_pressed)
	
	UpdateShaderParam("roll", _option8Checkbox.button_pressed)
	_option8LineEdit.text = str(_option8Checkbox.button_pressed)
	
	UpdateShaderParam("roll_speed", _option9HSlider.value)
	_option9LineEdit.text = str(_option9HSlider.value)
	
	UpdateShaderParam("roll_size", _option10HSlider.value)
	_option10LineEdit.text = str(_option10HSlider.value)
	
	UpdateShaderParam("roll_variation", _option11HSlider.value)
	_option11LineEdit.text = str(_option11HSlider.value)

	UpdateShaderParam("distort_intensity", _option14HSlider.value)
	_option14LineEdit.text = str(_option14HSlider.value)
	
	UpdateShaderParam("noise_opacity", _option15HSlider.value)
	_option15LineEdit.text = str(_option15HSlider.value)
	
	UpdateShaderParam("noise_speed", _option16HSlider.value)
	_option16LineEdit.text = str(_option16HSlider.value)
	
	UpdateShaderParam("static_noise_intensity", _option17HSlider.value)
	_option17LineEdit.text = str(_option17HSlider.value)

	UpdateShaderParam("aberration", _option18HSlider.value)
	_option18LineEdit.text = str(_option18HSlider.value)
	
	UpdateShaderParam("brightness", _option19HSlider.value)
	_option19LineEdit.text = str(_option19HSlider.value)
	
	UpdateShaderParam("discolor", _option20Checkbox.button_pressed)
	_option20LineEdit.text = str(_option20Checkbox.button_pressed)
	
	UpdateShaderParam("warp_amount", _option21HSlider.value)
	_option21LineEdit.text = str(_option21HSlider.value)
	
	UpdateShaderParam("clip_warp", _option22Checkbox.button_pressed)
	_option22LineEdit.text = str(_option22Checkbox.button_pressed)
	
	UpdateShaderParam("vignette_intensity", _option23HSlider.value)
	_option23LineEdit.text = str(_option23HSlider.value)
	
	UpdateShaderParam("vignette_opacity", _option24HSlider.value)
	_option24LineEdit.text = str(_option24HSlider.value)

func UpdateShaderParam(paramName, value):
	_colorRect.material.set_shader_parameter(paramName, value)

func _on_Option0Checkbox_pressed():
	if _option0Checkbox.button_pressed:
		_colorRect.visible = true
	else:
		_colorRect.visible = false

	_option0LineEdit.text = str(_option0Checkbox.button_pressed)
	
func _on_Option1Checkbox_pressed():
	UpdateShaderParam("overlay", _option1Checkbox.button_pressed)
	_option1LineEdit.text = str(_option1Checkbox.button_pressed)
	
func _on_Option2HSlider_value_changed(value):
	UpdateShaderParam("scanlines_opacity", value)
	_option2LineEdit.text = str(value)
	
func _on_Option3Slider_value_changed(value):
	UpdateShaderParam("scanlines_width", value)
	_option3LineEdit.text = str(value)
	
func _on_Option5HSlider_value_changed(value):
	UpdateShaderParam("grille_opacity", value)
	_option5LineEdit.text = str(value)

func _on_Option7Checkbox_pressed():
	UpdateShaderParam("pixelate", _option7Checkbox.button_pressed)
	_option7LineEdit.text = str(_option7Checkbox.button_pressed)

func _on_Option8Checkbox_pressed():
	UpdateShaderParam("roll", _option8Checkbox.button_pressed)
	_option8LineEdit.text = str(_option8Checkbox.button_pressed)

func _on_Option9HSlider_value_changed(value):
	UpdateShaderParam("roll_speed", value)
	_option9LineEdit.text = str(value)

func _on_Option10HSlider_value_changed(value):
	UpdateShaderParam("roll_size", value)
	_option10LineEdit.text = str(value)

func _on_Option11HSlider_value_changed(value):
	UpdateShaderParam("roll_variation", value)
	_option11LineEdit.text = str(value)

func _on_Option14HSlider_value_changed(value):
	UpdateShaderParam("distort_intensity", value)
	_option14LineEdit.text = str(value)
	
func _on_Option15HSlider_value_changed(value):
	UpdateShaderParam("noise_opacity", value)
	_option15LineEdit.text = str(value)

func _on_Option16HSlider_value_changed(value):
	UpdateShaderParam("noise_speed", value)
	_option16LineEdit.text = str(value)

func _on_Option17HSlider_value_changed(value):
	UpdateShaderParam("static_noise_intensity", value)
	_option17LineEdit.text = str(value)

func _on_Option18HSlider_value_changed(value):
	UpdateShaderParam("aberration", value)
	_option18LineEdit.text = str(value)

func _on_Option19HSlider_value_changed(value):
	UpdateShaderParam("brightness", value)
	_option19LineEdit.text = str(value)

func _on_Option20Checkbox_pressed():
	UpdateShaderParam("discolor", _option20Checkbox.button_pressed)
	_option20LineEdit.text = str(_option20Checkbox.button_pressed)

func _on_Option21HSlider_value_changed(value):
	UpdateShaderParam("warp_amount", value)
	_option21LineEdit.text = str(value)

func _on_Option22Checkbox_pressed():
	UpdateShaderParam("clip_warp", _option22Checkbox.button_pressed)
	_option22LineEdit.text = str(_option22Checkbox.button_pressed)

func _on_Option23HSlider_value_changed(value):
	UpdateShaderParam("vignette_intensity", value)
	_option23LineEdit.text = str(value)

func _on_Option24HSlider_value_changed(value):
	UpdateShaderParam("vignette_opacity", value)
	_option24LineEdit.text = str(value)














































