extends topSceneNodeType

var dialogueMode
var eventMode
var thisNpcName
signal NpcDialogue(NpcName)
signal NpcEvent(NpcName)

@export var dialogue: String
@export var transitionSceneAfterDialogue: bool
@export_file("*.tscn") var sceneToTransitionTo

var globalSceneTransitionTimer:Node

func _ready():
	globalSceneTransitionTimer = get_node("/root/GlobalSceneTransitionTimer")
	thisNpcName = self.name
	print(thisNpcName)
	print(dialogue)

func interactCall():
	print(dialogue)
	#need to add menu'ing capacity for dialogue
	
	#after finishing the dialouge, we should move to a new scene, if required
	if transitionSceneAfterDialogue:
		sceneTransitionTimer.start_sceneTransitionTimer.emit()
		get_tree().change_scene_to_file(sceneToTransitionTo) #TOCO: we should have a manager handle this
	
