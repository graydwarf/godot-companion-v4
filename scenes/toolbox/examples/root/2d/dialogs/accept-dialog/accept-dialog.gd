extends Node2D
	
func ShowAcceptDialog():
	$AcceptDialog.show()

func SetResponseText(message):
	$ResponseLabel.text = message

func UserAcceptedDialog():
	SetResponseText("User accepted the dialog!")
	
func _on_AcceptDialog_confirmed() -> void:
	UserAcceptedDialog()

func _on_ShowDialogButton_pressed() -> void:
	ShowAcceptDialog()

func _on_accept_dialog_close_requested():
	UserAcceptedDialog()

