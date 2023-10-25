extends PanelContainer

@onready var _godotCompanionLinkButton = $VBoxContainer/CenterContainer5/GodotCompanionLinkButton
@onready var _godotDiscordLinkButton = $VBoxContainer/CenterContainer2/GodotDiscordLinkButton
@onready var _godotWebSiteLinkButton = $VBoxContainer/CenterContainer9/GodotWebSiteLinkButton
@onready var _godotShadersLinkButton = $VBoxContainer/CenterContainer7/GodotShadersLinkButton
@onready var _patreonLinkButton = %PatreonLinkButton
@onready var _kofiLinkButton = %KoFiLinkButton
@onready var _itchIoLinkButton = %ItchIoLinkButton
	
func _on_GodotDiscordLinkButton_pressed() -> void:
	Common.NavigateToUri(_godotDiscordLinkButton.text)

func _on_GodotCompanionLinkButton_pressed() -> void:
	Common.NavigateToUri(_godotCompanionLinkButton.text)

func _on_GodotWebSiteLinkButton_pressed() -> void:
	Common.NavigateToUri(_godotWebSiteLinkButton.text)

func _on_GodotShadersLinkButton_pressed() -> void:
	Common.NavigateToUri(_godotShadersLinkButton.text)

func _on_PatreonLinkButton_pressed():
	Common.NavigateToUri(_patreonLinkButton.text)

func _on_KoFiLinkButton_pressed():
	Common.NavigateToUri(_kofiLinkButton.text)

func _on_itch_io_link_button_pressed() -> void:
	Common.NavigateToUri(_itchIoLinkButton.text)
