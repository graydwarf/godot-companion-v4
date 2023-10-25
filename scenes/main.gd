extends PanelContainer

@onready var _videos = $VBoxContainer/HBoxContainer/ContentContainer/Videos
@onready var _contentContainer = $VBoxContainer/HBoxContainer/ContentContainer
@onready var _navbar = $VBoxContainer/HBoxContainer/CenterContainer/MarginContainer/NavBar

var _homePage
var _about
var _toolbox

func _ready():
	InitSignals()
	UpdateView("Home")

func InitSignals():
	Signals.connect("UpdateView", UpdateView)

func ShowNavBar():
	_navbar.visible = true
	
func HideNavBar():
	_navbar.visible = false
	
func HideAllNavs():
	_videos.visible = false
	self_modulate = Color(1.0, 1.0, 1.0, 1.0)
	if is_instance_valid(_homePage):
		_homePage.queue_free()
	if is_instance_valid(_toolbox):
		_toolbox.queue_free()
	if is_instance_valid(_about):
		_about.queue_free()

func UpdateView(viewName):
	HideAllNavs()
	if viewName == "Home":
		_homePage = load("res://scenes/home-page/home-page.tscn").instantiate()
		_contentContainer.add_child(_homePage)
	elif viewName == "Videos":
		_videos.visible = true
	elif viewName == "Toolbox":
		_toolbox = load("res://scenes/toolbox/toolbox.tscn").instantiate()
		_contentContainer.add_child(_toolbox)
	elif viewName == "About":
		_about = load("res://scenes/about/about.tscn").instantiate()
		_contentContainer.add_child(_about)

func _unhandled_input(event):
	if event is InputEventKey:
		# can't close dialog with esc because tree is paused
		if event.pressed:
			Signals.emit_signal("KeyPressed", event.keycode)
