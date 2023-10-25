extends Control

func SetResponse(response):
	$CenterContainer/ResponseLabel.text = response

func ShowWindowsDialog():
	$Window.call_deferred("popup")
	
func CloseDialog():
	$Window.visible = false

func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes cake.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, there is clearly something wrong with this user!")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowWindowsDialog()

func _on_WindowDialog_popup_hide():
	CloseDialog()
