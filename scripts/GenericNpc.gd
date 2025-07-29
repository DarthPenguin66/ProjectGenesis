extends Area2D

var dialogueMode
var eventMode
var thisNpcName
signal NpcDialogue(NpcName)
signal NpcEvent(NpcName)

@export var dialogue: String
@export var transitionSceneAfterDialogue: bool
@export_file("*.tscn") var sceneToTransitionTo

func _ready():
	thisNpcName = self.name
	print(thisNpcName)
	print(dialogue)

func interactCall():
	print(dialogue)
	#need to add menu'ing capacity for dialogue
	
	#after finishing the dialouge, we should move to a new scene, if required
	if transitionSceneAfterDialogue:
		get_tree().change_scene_to_file(sceneToTransitionTo)
	
