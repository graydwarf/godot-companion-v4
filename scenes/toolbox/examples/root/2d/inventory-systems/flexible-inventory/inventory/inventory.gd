extends Node2D
class_name Inventory

signal ToggleDragState

@onready var _slotScene = preload("res://scenes/toolbox/examples/root/2d/inventory-systems/flexible-inventory/slot/slot.tscn")
@onready var _inventoryGrid = $BackgroundNinePatchRect/InventoryGrid
@onready var _background = $BackgroundNinePatchRect

var _slotCount : float = 20.0
var _columnCount : float = 5.0
var _originalGrabPosition : Vector2
var _originalDialogPosition : Vector2
var _draggingInventory = false
var _backgroundWidth = 0
var _backgroundHeight = 0
var _inventoryType = "Standard"

func _ready():
	InitSignals()

func InitSignals():
	connect("ToggleDragState", ToggleDragState2)

func ConfigureInventory(slotCount = _slotCount, columnCount = _columnCount):
	_slotCount = slotCount
	_columnCount = columnCount
	CreateInventoryGrid()

func SetInventoryType(inventoryType):
	_inventoryType = inventoryType

func GetInventoryType():
	return _inventoryType
	
func AddSlot():
	_slotCount += 1.0
	CreateSlot(_slotCount - 1)
	RefreshInventory()

func RemoveSlot():
	_slotCount -= 1.0
	if _slotCount < 0.0:
		_slotCount = 0.0
	
	var slot = _inventoryGrid.get_child(_inventoryGrid.get_child_count() - 1)
	_inventoryGrid.remove_child(slot)
	RefreshInventory()

func GetSlots():
	return _inventoryGrid.get_children()
	
func AddColumn():
	_columnCount += 1.0
	RefreshInventory()

func RemoveColumn():
	_columnCount -= 1.0
	if _columnCount < 1.0:
		_columnCount = 1.0
	RefreshInventory()
	
func ClearGrid():
	for child in _inventoryGrid.get_children():
		_inventoryGrid.remove_child(child)
		child.queue_free()

func RefreshInventory():
	if _columnCount <= 0.0:
		_columnCount = 1.0
	AdjustBackgroundSize()
	AdjustGridSize()
	var leftMargin = _inventoryGrid.get_theme_constant("h_separation")
	var topMargin = 8
	var offsetX = leftMargin
	_inventoryGrid.position = Vector2(offsetX, topMargin)
		
func CreateInventoryGrid():
	CreateInventorySlots()
	RefreshInventory()

func AdjustGridSize():
	_inventoryGrid.columns = _columnCount
	
func AdjustBackgroundSize():
	var slotSize = 18
	var leftMargin = _inventoryGrid.get_theme_constant("h_separation")
	var topMargin = 8
	var minHeight = 0 
	_backgroundWidth = leftMargin + (_columnCount * slotSize) + (_inventoryGrid.get_theme_constant("h_separation") * (_columnCount))
	var calculatedRowCount = ceil(_slotCount / _columnCount) # 15 rounds up to 16
	_backgroundHeight = topMargin + (calculatedRowCount * slotSize) + (_inventoryGrid.get_theme_constant("v_separation") * calculatedRowCount)
	if _backgroundHeight < minHeight:
		_backgroundHeight = minHeight
	_background.size = Vector2(_backgroundWidth, _backgroundHeight)

func GetWidth():
	return _backgroundWidth

func GetHeight():
	return _backgroundHeight
	
func CreateInventorySlots():
	for i in _slotCount:
		CreateSlot(i)

func CreateSlot(slotIndex):
	var slot = _slotScene.instantiate()
	slot.SetSlotIndex(slotIndex)
	_inventoryGrid.add_child(slot)
	
func ShowInventory():
	visible = true

func HideInventory():
	visible = false

func IsShowing():
	return visible
	
func _process(_delta):
	if _draggingInventory:
		var mousePosition = get_viewport().get_mouse_position()
		if _originalGrabPosition == Vector2(0, 0):
			_originalGrabPosition = mousePosition
			_originalDialogPosition = self.position
		self.position = _originalDialogPosition + (mousePosition - _originalGrabPosition)
	else:
		_originalGrabPosition = Vector2(0, 0)
		
func ToggleDragState2():
	_draggingInventory =! _draggingInventory

func _on_BackgroundNinePatchRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			emit_signal("ToggleDragState")
		elif event.button_index == MOUSE_BUTTON_LEFT and !event.pressed:
			emit_signal("ToggleDragState")
