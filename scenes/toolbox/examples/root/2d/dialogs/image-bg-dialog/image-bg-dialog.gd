extends Node2D
	
func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	$ImageBgDialog.visible = true

func CloseDialog():
	HideDialog()

func HideDialog():
	$ImageBgDialog.visible = false

func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes it.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, welp.. I dunno about you.")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowDialog()
