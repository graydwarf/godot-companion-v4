extends HBoxContainer

@onready var _chalkBoard = $VBoxContainer/HSplitContainer/HBoxContainer/VSplitContainer2/VSplitContainer/PanelContainer/MarginContainer/VBoxContainer/ChalkBoard
@onready var _launchGitHubUrlButton = $VBoxContainer/HSplitContainer/HBoxContainer/VSplitContainer2/VSplitContainer/HBoxContainer/PanelContainer/GridContainer/HBoxContainer/LaunchGitHubUrlButton
@onready var _launchYoutubeButton = $VBoxContainer/HSplitContainer/HBoxContainer/VSplitContainer2/VSplitContainer/HBoxContainer/PanelContainer/GridContainer/HBoxContainer/LaunchYoutubeButton
@onready var _launchGodotDocUrlButton = $VBoxContainer/HSplitContainer/HBoxContainer/VSplitContainer2/VSplitContainer/HBoxContainer/PanelContainer/GridContainer/HBoxContainer/LaunchGodotDocUrlButton
@onready var _launchGodotShaderButton = $VBoxContainer/HSplitContainer/HBoxContainer/VSplitContainer2/VSplitContainer/HBoxContainer/PanelContainer/GridContainer/HBoxContainer/LaunchGodotShadersUrlButton
@onready var _exampleTree = $VBoxContainer/HSplitContainer/VBoxContainer/ScrollContainer/ExampleTree
@onready var _seizureWarning = $VBoxContainer/HSplitContainer/HBoxContainer/VSplitContainer2/VSplitContainer/PanelContainer/MarginContainer/VBoxContainer/SeizureWarningScreen

var _exampleDetailsData : Dictionary
var _treeNodePath = ""
var _gitHubUrl = ""
var _godotDocUrl = ""
var _godotShaderUrl = ""
var _youtubeVideoId = ""
var _isTreeBusy = false
var _isLoading = true

func _ready() -> void:
	Signals.connect("CancelExample", CancelExample)
	Signals.connect("LoadExampleData", LoadExampleData)
	InitExampleData()
	_isLoading = false
	set_process_unhandled_input(true)

func CancelExample():
	ClearChalkBoard()
	
func HideSeizureWarning():
	_seizureWarning.visible = false

func ShowChalkBoard():
	_chalkBoard.visible = true

func ResetUrls():
	_gitHubUrl = ""
	_godotDocUrl = ""
	_godotShaderUrl = ""
	_youtubeVideoId = ""
	_godotShaderUrl = ""
	
func UpdateToolboxNavButtons():
	ResetExampleToolbar()
	if _gitHubUrl != "":
		_launchGitHubUrlButton.visible = true
		_launchGitHubUrlButton.tooltip_text = "Open 3.x Example On GitHub"

	if _godotDocUrl != "":
		_launchGodotDocUrlButton.visible = true
		_launchGodotDocUrlButton.tooltip_text = "Open Godot Topic"

	if _godotShaderUrl != "":
		_launchGodotShaderButton.visible = true
		_launchGodotShaderButton.tooltip_text = "Open On GodotShaders.com"
		
	if _youtubeVideoId != "":
		_launchYoutubeButton.visible = true
		_launchYoutubeButton.tooltip_text = "View YouTube Topic"

func ClearChalkBoard():
	if _chalkBoard.get_child_count() > 0:
		var example = _chalkBoard.get_child(0)
		if is_instance_valid(example):
			_chalkBoard.remove_child(example)
			example.queue_free()
	_chalkBoard.visible = false

func ResetExampleToolbar():
	_launchGitHubUrlButton.visible = false
	_launchYoutubeButton.visible = false
	_launchGodotDocUrlButton.visible = false
	_launchGodotShaderButton.visible = false
	
func NavigateToGithub():
	Common.NavigateToUri(_gitHubUrl)

func LaunchYouTubeVideo():
	var uri = "https://www.youtube.com/watch?v=" + _youtubeVideoId
	Common.NavigateToUri(uri)

func _on_LaunchYoutubeButton_pressed() -> void:
	LaunchYouTubeVideo()

func LaunchGodotDocUrl():
	Common.NavigateToUri(_godotDocUrl)

func LaunchGodotShadersUrl():
	Common.NavigateToUri(_godotShaderUrl)
	
func _on_LaunchGodotShadersUrlButton_pressed():
	LaunchGodotShadersUrl()

func _on_LaunchGodotDocUrlButton_pressed():
	LaunchGodotDocUrl()

func _on_LaunchGitHubUrlButton_pressed():
	NavigateToGithub()

func InitExampleData():
	_exampleDetailsData = Game.GetToolBoxDetailsData()
	CreateExampleTree(_exampleDetailsData)

func CreateExampleTree(dict : Dictionary):
	var root = _exampleTree.create_item()
	_exampleTree.set_hide_root(true)

	for key in dict.keys():
		var treeNode = _exampleTree.create_item(root)
		treeNode.set_text(0, key)
		RecursivelyAddChildTreeNodes(dict[key], treeNode)

func RecursivelyAddChildTreeNodes(dataNode, treeNode):
	var check = {} # The value type is 18 apparently
	var valueType = typeof(dataNode)
	if valueType != typeof(check):
		return
	else:
		for key in dataNode.keys():
			var entry = _exampleTree.create_item(treeNode)
			entry.collapsed = true
			entry.set_text(0, key)
			
			# Only want parent nodes
			if !dataNode[key].has("ExampleScenePath"):
				RecursivelyAddChildTreeNodes(dataNode[key], entry)
			else:
				# Make example nodes standout from directories
				entry.set_custom_color(0, Color(0.3,0.7,1.0,0.6))
			
func CreateTreeNode(parentNode):
	return _exampleTree.create_item(parentNode)
	
func LoadExampleData():
	var listOfNodesInPath = _treeNodePath.split("/")
	var segment : Dictionary = _exampleDetailsData
	for node in listOfNodesInPath:
		segment = segment[node]

	if !segment.has("ExampleScenePath"):
		return
		
	var scenePath = segment["ExampleScenePath"]
	if segment.has("GitHubUrl"):
		_gitHubUrl = segment["GitHubUrl"]
	if segment.has("GodotDocUrl"):
		_godotDocUrl = segment["GodotDocUrl"]
	if segment.has("YoutubeVideoId"):
		_youtubeVideoId = segment["YoutubeVideoId"]
	if segment.has("GodotShaderUrl"):
		_godotShaderUrl = segment["GodotShaderUrl"]
		
	LoadExample(scenePath, true)
	_chalkBoard.focus_mode = Control.FOCUS_ALL
	UpdateToolboxNavButtons()
	
func LoadExample(scenePath, isHidingSeizureWarning = false):
	if isHidingSeizureWarning:
		HideSeizureWarning()
		ShowChalkBoard()
		
	ClearChalkBoard()
	ResetExampleToolbar()
	if scenePath == "":
		return
	else:
		var exampleScene = load(scenePath)
		_chalkBoard.add_child(exampleScene.instantiate())
		_chalkBoard.visible = true

func BuildTreeNodePath():
	var selectedNode = _exampleTree.get_selected()
	if !is_instance_valid(selectedNode):
		return
		
	var treeNodePath = selectedNode.get_text(0)
	while selectedNode.get_parent() != null:
		selectedNode = selectedNode.get_parent()
		var nodeText = selectedNode.get_text(0)
		if nodeText != null && nodeText != "":
			treeNodePath = nodeText + "/" + treeNodePath
	return treeNodePath

func TreeNodeSelected():
	ResetUrls()
	_treeNodePath = BuildTreeNodePath()
	LoadExampleData()

func _on_ExampleTree_item_selected():
	TreeNodeSelected()
