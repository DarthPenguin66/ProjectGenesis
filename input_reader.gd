extends Node

var playerNode
@onready var ray = $RayCast2D
var tileSize

var functions 
var properties

func _ready():
	
	playerNode = get_node("/root/Main/playerTree/Player") #this is bad, we should find better way than hard coded paths
	print(playerNode.name)
	tileSize = playerNode.tile_size
	'''
	var mainNode = get_parent()
	print(mainNode.name)
	var playerTreeNode = mainNode.find_child("playerTree")
	print(playerTreeNode.name)
	playerNode = playerTreeNode.get_child(0)
	'''
	
	
	
func _input(event):
	if event.is_action_pressed("keyboard_interact"):
		ray.transform = playerNode.transform
		ray.target_position = playerNode.facingDirection * tileSize
		ray.force_raycast_update() #causes the raycast to update outside of a physics frame. Needed to get immediate feedback
		var InteractObject = ray.get_collider()
		if InteractObject:
			functions = InteractObject.get_method_list()
			properties = InteractObject.get_property_list()
			print(InteractObject.name)
			InteractObject.interactCall()
			print("interacted with object")
