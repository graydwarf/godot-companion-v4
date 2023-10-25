extends Control

@onready var _popupMenu = $Control/PopupMenu
@onready var _outputLabel = $MarginContainer/VBoxContainer/MarginContainer/OutputLabel
@onready var _control = $Control

var _isDraggingControl = false
var _localMousePosition = Vector2(0,0)

func _ready():
	LoadValueIntoPopupMenuDynamically()

# Just showing one example of adding a new item
# I normally re-create the popup menu on the fly in
# my applications because the list items tend to change
# based on context.
func LoadValueIntoPopupMenuDynamically():
	_popupMenu.add_item("Item Added Dynamically")
	
func _process(_delta):
	var globalMousePosition = get_global_mouse_position()
	if _isDraggingControl:
		_control.global_position = globalMousePosition - _localMousePosition

# Pass in a displayOffset for fine tuning the popup position
func ShowPopupMenu(popupOffset):
	_popupMenu.position = popupOffset
	_popupMenu.visible = true

func DisplayOutput(text):
	_outputLabel.text = text

func HidePopupMenu():
	_popupMenu.visible = false

func _on_PopupMenu_index_pressed(index):
	DisplayOutput("Your selection: " + _popupMenu.get_item_text(index))

func _on_Control_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		HidePopupMenu()
		_localMousePosition = _control.get_local_mouse_position()
		_isDraggingControl = true
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and !event.is_pressed():
		HidePopupMenu()
		_isDraggingControl = false
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
		var controlPosition = _control.global_position
		var localMousePosition = _control.get_local_mouse_position()
		var offset = Vector2(10, -10)
		var popupOffset = controlPosition + localMousePosition + offset
		ShowPopupMenu(popupOffset)

func _on_PopupMenuIcon_pressed():
	if _popupMenu.visible:
		_popupMenu.visible = false
	else:
		var popupOffset = _control.global_position + Vector2(90, 2)
		ShowPopupMenu(popupOffset)

func _on_SimplePopupMenu_gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		HidePopupMenu()
