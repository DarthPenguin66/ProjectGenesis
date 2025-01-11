extends Area2D

var dialogueMode
var eventMode
var thisNpcName
signal NpcDialogue(NpcName)
signal NpcEvent(NpcName)

@export var dialogue: String

func _ready():
	thisNpcName = self.name
	print(thisNpcName)
	print(dialogue)

func interactCall():
	print(dialogue)
	#need to add menu'ing capacity for dialogue
