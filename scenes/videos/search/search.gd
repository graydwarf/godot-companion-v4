extends HBoxContainer

func _on_TextInput_text_changed(new_text: String) -> void:
	Signals.emit_signal("SearchTextChanged", new_text)

func _on_ClearSearchButton_pressed() -> void:
	$TextInput.text = ""
	Signals.emit_signal("SearchTextChanged", "")
