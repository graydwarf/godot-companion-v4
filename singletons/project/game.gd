extends Node

var _isDebugging = false

func _ready():
	if _isDebugging:
		print("DEBUGGING DEBUGGING DEBUGGING DEBUGGING!")
		print("            <<< DEBUGGING >>>           ")
		print("DEBUGGING DEBUGGING DEBUGGING DEBUGGING!")

func GetToolBoxDetailsData():
	return {
		"2d": {
			"Animations": {
				"Sprite2D Animations": {
					"Animated Sprite2D": {
						"TreeViewPath": "Root/2d/Animations/Sprite2D Animations/Animated Sprite2D",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animated-sprite/animated-sprite.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/sprite-animations",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html",
						"YoutubeVideoId": ""
					},
					"Animated Sprite2D Sheet": {
						"TreeViewPath": "Root/2d/Animations/Sprite2D Animations/Animated Sprite2D Sheet",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animated-sprite-sheet/animated-sprite-sheet.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/gc-2d-sprite-animations",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html",
						"YoutubeVideoId": ""
					},
					"Animation Player": {
						"TreeViewPath": "Root/2d/Animations/Sprite2D Animations/Animation Player",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animation-player/animation-player.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/gc-2d-sprite-animations",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html",
						"YoutubeVideoId": ""
					},
					"Animation Tree": {
						"TreeViewPath": "Root/2d/Animations/Sprite2D Animations/Animation Tree",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/sprite-animations/animation-tree/animation-tree.tscn", 
						"GitHubUrl": "https://github.com/jontopielski/Top-Down-Sprite2D-Tutorial",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_animationtree.html",
						"YoutubeVideoId": "https://www.youtube.com/watch?v=Xf2RduncoNU"
					},
				},
				"Text Animations": {
						"Floating Text Using Animation Player": {
							"TreeViewPath": "Root/2d/Animations/Text Animations/Floating Text Using Animation Player",
							"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/animations/text-animations/floating-text/floating-text-using-animation-player.tscn", 
							"GitHubUrl": "https://github.com/graydwarf/floating-text-using-animation-player",
							"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_animationplayer.html",
							"YoutubeVideoId": ""
					},
				},
				"Top-Down": {
					"Top-Down Shooter": {
						"TreeViewPath": "Root/2d/Top-Down/Top-Down Shooter",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/top-down/top-down-shooter/top-down-shooter.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/top-down-shooter",
						"GodotDocUrl": "",
						"YoutubeVideoId": ""
					},
				},
			},
			"Controls": {
				"Custom Controls": {
					"Monitor Overlay": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/custom-controls/monitor-overlay/monitor-overlay.tscn", 
						"GitHubUrl": "https://github.com/HungryProton/monitor_overlay",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html",
						"YoutubeVideoId": ""
					},
				},
				"Drag & Drop": {
					"Drag Node": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/drag-and-drop/drag-node/drag-node.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/gc-drag-node",
						"GodotDocUrl": "https://docs.godotengine.org/en/3.0/tutorials/2d/2d_movement.html",
						"YoutubeVideoId": ""
					},
				},
				"PopupMenu": {
					"Simple PopupMenu": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/popup-menu/simple-popup-menu/simple-popup-menu.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/gc-simple-popup-menu",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_popupmenu.html",
						"YoutubeVideoId": ""
					},
				},
				"Resizing": {
					"Simple Resize": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/resizing/simple-resize/simple-resize.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/gc-simple-resize",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/tutorials/inputs/mouse_and_input_coordinates.html",
						"YoutubeVideoId": ""
					},
				},
				"Tree": {
					"Dynamic Tree": {
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/tree/dynamic-treeview/dynamic-treeview.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/gc-dynamic-treeview",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_tree.html",
						"YoutubeVideoId": ""
					},
					"Simple Text Tree": {
						"TreeViewPath": "Root/2d/Controls/Tree/Simple Text Tree",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/controls/tree/simple-text-treeview/simple-text-treeview.tscn", 
						"GitHubUrl": "https://github.com/graydwarf/simple-text-treeview",
						"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_tree.html",
						"YoutubeVideoId": ""
					},
				},
			},
			"Dialogs": {
				"Accept Dialog": {
					"TreeViewPath": "Root/2d/Dialogs/Accept Dialog",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/accept-dialog/accept-dialog.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/gc-dialogs",
					"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_acceptdialog.html#class-acceptdialog",
					"YoutubeVideoId": ""
				},
				"Confirmation Dialog": {
					"TreeViewPath": "Root/2d/Dialogs/Confirmation Dialog",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/confirmation-dialog/confirmation-dialog.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/gc-dialogs",
					"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_confirmationdialog.html?highlight=Confirmation%20Dialog",
					"YoutubeVideoId": ""
				},
				"ColorRect Dialog": {
					"TreeViewPath": "Root/2d/Dialogs/ColorRect Dialog",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/color-rect-dialog/color-rect-dialog.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/gc-dialogs",
					"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_colorrect.html",
					"YoutubeVideoId": ""
				},
				"File Dialog": {
					"TreeViewPath": "Root/2d/Dialogs/File Dialog",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/file-dialog/file-dialog.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/gc-dialogs",
					"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_filedialog.html",
					"YoutubeVideoId": ""
				},
				"Image Background Dialog": {
					"TreeViewPath": "Root/2d/Dialogs/Image Background Dialog",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/image-bg-dialog/image-bg-dialog.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/gc-dialogs",
					"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_sprite.html",
					"YoutubeVideoId": ""
				},
				"Windows Dialog": {
					"TreeViewPath": "Root/2d/Dialogs/Windows Dialog",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/dialogs/windows-dialog/windows-dialog.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/gc-dialogs",
					"GodotDocUrl": "https://docs.godotengine.org/en/stable/classes/class_windowdialog.html",
					"YoutubeVideoId": ""
				},
			},
			"Inventory Systems": {
				"Flexible Inventory": {
					"TreeViewPath": "Root/2d/Inventory Systems/Flexible Inventory",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/inventory-systems/flexible-inventory/flexible-inventory.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/flexible-inventory",
					"GodotDocUrl": "",
					"YoutubeVideoId": ""
				},
			},
			"Lines": {
				"Dotted Lines": {
					"TreeViewPath": "Root/2d/Lines/Dotted Lines",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/lines/dotted-lines/dotted-lines.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/gc-dotted-lines",
					"GodotDocUrl": "",
					"YoutubeVideoId": ""
				},
			},
			"Movement": {
				"Infinite Space": {
					"TreeViewPath": "Root/2d/Movement/Infinite Space",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/movement/infinite-space/infinite-space.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/infinite-space",
					"GodotDocUrl": "",
					"YoutubeVideoId": ""
				},
				"Thruster Particles": {
					"TreeViewPath": "Root/2d/Movement/Thruster Particles",
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/movement/thruster-particles/scenes/thruster-particles.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/thruster-particles",
					"GodotDocUrl": "",
					"YoutubeVideoId": ""
				},
			},
			"Shaders": {
				"Canvas Item": {
					"Animated Stripes": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/Animated Stripes",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/animated-stripes/animated-stripes.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/animated-stripes",
					},
					"God Rays": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/God Rays",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/god-rays/god-rays.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/god-rays/"
					},
					"Hexagonal Tiling Cog Wheels": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/Hexagonal Tiling Cog Wheels",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/hexagonal-tiling-cog-wheels/hexagonal-tiling-cog-wheels.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/hexagonal-tiling-cog-wheels/"
					},
					"Pixel Explosion": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/Pixel Explosion",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/pixel-explosion/pixel-explosion.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/pixel-explosion"
					},
					"Radial Blur": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/Radial Blur",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/radial-blur/radial-blur.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/radial-blur",
					},
					"Super Hex": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/Super Hex",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/super-hex/super-hex.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/super-hex",
					},
					"Tile Based Triangle-Rects": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/Tile Based Triangle-Rects",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/tile-based-triangles-rects/tile-based-triangles-rects.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/tile-based-triangles-rects"
					},
					"VHS and CRT Monitor Effect": {
						"TreeViewPath": "Root/2d/Shaders/Canvas Item/VHS and CRT Monitor Effect",
						"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/shaders/canvas-item/vhs-and-crt-monitor-effect/vhs-and-crt-monitor-effect.tscn", 
						"GodotShaderUrl": "https://godotshaders.com/shader/vhs-and-crt-monitor-effect/"
					},
				}
			},
			"Themes": {
				"Simple-Dynamic-Themes": {
					"ExampleScenePath": "res://scenes/toolbox/examples/root/2d/themes/simple-dynamic-themes/simple-dynamic-themes.tscn", 
					"GitHubUrl": "https://github.com/graydwarf/simple-dynamic-themes",
					"GodotDocUrl": "https://docs.godotengine.org/en/stable/tutorials/ui/gui_using_theme_editor.html",
					"YoutubeVideoId": ""
				}
			}
		},
	}
