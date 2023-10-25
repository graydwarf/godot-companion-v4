extends Panel
class_name Slot
var _slotIndex = -1

func SetSlotIndex(value):
	_slotIndex = value
	SetSlotName()
	
func SetSlotName():
	name = "Slot" + str(_slotIndex)

