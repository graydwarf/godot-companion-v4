extends VBoxContainer

func _on_HomeButton_pressed():
	$HomeButton.release_focus()
	Signals.emit_signal("UpdateView", "Home")

func _on_VideosButton_pressed():
	$VideosButton.release_focus()
	Signals.emit_signal("UpdateView", "Videos")

func _on_ToolboxButton_pressed():
	$ToolboxButton.release_focus()
	Signals.emit_signal("UpdateView", "Toolbox")

func _on_AboutButton_pressed():
	$AboutButton.release_focus()
	Signals.emit_signal("UpdateView", "About")
