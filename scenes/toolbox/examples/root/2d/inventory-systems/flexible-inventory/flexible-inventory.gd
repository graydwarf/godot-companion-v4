extends Node2D
@onready var _inventoryScene = preload("res://scenes/toolbox/examples/root/2d/inventory-systems/flexible-inventory/inventory/inventory.tscn")
var _inventory

func _ready():
	AddInventory(4, 2, 200, 150)
		
func AddInventory(slotCount, columnCount, offsetX, offsetY):
	_inventory = _inventoryScene.instantiate()
	$InventoryContainer.add_child(_inventory)
	_inventory.position = Vector2(offsetX, offsetY)
	_inventory.ConfigureInventory(slotCount, columnCount)

	
func AddSlot():
	_inventory.AddSlot()

func RemoveSlot():
	_inventory.RemoveSlot()

func AddColumn():
	_inventory.AddColumn()

func RemoveColumn():
	_inventory.RemoveColumn()
		
func _on_AddSlotButton_pressed():
	AddSlot()

func _on_RemoveSlotButton_pressed():
	RemoveSlot()

func _on_AddColumnButton_pressed():
	AddColumn()

func _on_RemoveColumnButton_pressed():
	RemoveColumn()

func _on_AddNewInventoryButton_pressed():
	AddInventory(4, 2, 200, 185)
