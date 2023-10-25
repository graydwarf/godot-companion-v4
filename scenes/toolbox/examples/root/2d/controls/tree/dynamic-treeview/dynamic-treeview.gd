extends Control

@onready var _tree = $VBoxContainer/Tree
@onready var _output = $VBoxContainer/OutputLineEdit

var _data : Dictionary

func _ready():
	InitExampleData()

func InitExampleData():
	CreateDataDictionary()
	CreateExampleTree(_data)

func CreateExampleTree(dict : Dictionary):
	var root = _tree.create_item()
	_tree.set_hide_root(true)

	for key in dict.keys():
		var treeNode = _tree.create_item(root)
		treeNode.set_text(0, key)
		RecursivelyAddChildTreeNodes(dict[key], treeNode)

func RecursivelyAddChildTreeNodes(dataNode, treeNode):
	for key in dataNode.keys():
		var treeItem = _tree.create_item(treeNode)
		treeItem.collapsed = true
		treeItem.set_text(0, key)
		
		# Only want parent nodes
		if !dataNode[key].has("ExampleScenePath"):
			RecursivelyAddChildTreeNodes(dataNode[key], treeItem)
		else:
			# Make example nodes stand out from directories
			treeItem.set_custom_color(0, Color(0.3,0.7,1.0,0.6))
			
func CreateTreeNode(parentNode):
	return _tree.create_item(parentNode)
	
func CreateDataDictionary():
	_data = {
		"2d": {
			"Animations": {
				"Sprite2D Animations": {
					"Animated Sprite2D": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animated-sprite/animated-sprite.tscn", 
					},
					"Animated Sprite2D Sheet": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animated-sprite-sheet/animated-sprite-sheet.tscn", 
					},
					"Animation Player": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animation-player/animation-player.tscn", 
					},
					"Animation Tree": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animation-tree/animation-tree.tscn", 
					},
				},
				"Text Animations": {
						"Floating Text Using Animation Player": {
							"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/text-animations/floating-text/floating-text-using-animation-player.tscn", 
					},
				},
				"Top-Down": {
					"Top-Down Shooter": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/top-down/top-down-shooter/top-down-shooter.tscn", 
					},
				},
			},
			"Controls": {
				"Drag & Drop": {
					"Drag Node": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/drag-and-drop/drag-node/drag-node.tscn", 
					},
				},
				"Tree": {
					"Simple Text Tree": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/tree/simple-text-treeview/simple-text-treeview.tscn", 
					},
				},
			},
			"Dialogs": {
				"Accept Dialog": {
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/accept-dialog/accept-dialog.tscn", 
				},
				"Confirmation Dialog": {
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/confirmation-dialog/confirmation-dialog.tscn", 
				},
			},
			"Inventory Systems": {
				"Flexible Inventory": {
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/inventory-systems/flexible-inventory/flexible-inventory.tscn", 
				},
			},
			"Lines": {
				"Dotted Lines": {
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/lines/dotted-lines/dotted-lines.tscn", 
				},
			},
			"Movement": {
				"Infinite Space": {
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/movement/infinite-space/infinite-space.tscn", 
				},
				"Thruster Particles": {
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/movement/thruster-particles/scenes/thruster-particles.tscn", 
				},
			},
			"Shaders": {
				"Canvas Item": {
					"Animated Stripes": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/animated-stripes/animated-stripes.tscn", 
					},
					"Pixel Explosion": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/pixel-explosion/pixel-explosion.tscn", 
					},
					"Radial Blur": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/radial-blur/radial-blur.tscn", 
					},
				}
			}
		},
	}
	
func LoadExampleData(treeNodePath):
	var listOfNodesInPath = treeNodePath.split("/")
	var segment : Dictionary = _data
	for node in listOfNodesInPath:
		segment = segment[node]

	if !segment.has("ExampleScenePath"):
		_output.text = treeNodePath
		return

	_output.text = segment["ExampleScenePath"]

func BuildTreeNodePath():
	var selectedNode = _tree.get_selected()
	var treeNodePath = selectedNode.get_text(0)
	while selectedNode.get_parent() != null:
		selectedNode = selectedNode.get_parent()
		var nodeText = selectedNode.get_text(0)
		if nodeText != null && nodeText != "":
			treeNodePath = nodeText + "/" + treeNodePath
	return treeNodePath

func _on_Tree_item_selected():
	var treeNodePath = BuildTreeNodePath()
	LoadExampleData(treeNodePath)

