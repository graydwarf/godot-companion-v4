extends Node2D
	
func SetResponseText(response):
	$ResponseLabel.text = response

func ShowDialog():
	$ConfirmationDialog.show()

func _on_ConfirmationDialog_confirmed() -> void:
	SetResponseText("We now own the users soul for eternity.")

func _on_OpenDialogButton_pressed() -> void:
	SetResponseText("Waiting for users response...")
	ShowDialog()

func _on_confirmation_dialog_canceled():
	SetResponseText("Ahh... to give up the shiny new thing on principal... well done.")
