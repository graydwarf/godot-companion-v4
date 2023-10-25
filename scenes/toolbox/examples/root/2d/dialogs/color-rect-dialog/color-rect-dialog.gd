extends Node2D

func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	$Dialog.visible = true

func CloseDialog():
	$Dialog.visible = false

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowDialog()

func _on_yes_button_pressed():
	SetResponse("Yes, well... who wouldn't.")
	CloseDialog()

func _on_no_button_pressed():
	SetResponse("No!?!, welp.. you could always use an image.")
	CloseDialog()

func _on_cancel_button_pressed():
	SetResponse("Oh... we have an indecisive one among us...")
	CloseDialog()
