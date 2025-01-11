extends Node

var tree_holder
var pauseMenuCanvas

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	tree_holder = get_tree()
	pauseMenuCanvas = get_child(0)
	pauseMenuCanvas.visible = false

func _input(event):
	if event.is_action_pressed("keyboard_esc"):
		if tree_holder.paused:
			tree_holder.paused = false
			pauseMenuCanvas.visible = false
			print("unpaused")
		else:
			tree_holder.paused = true
			pauseMenuCanvas.visible = true
			print("paused")
	pass
