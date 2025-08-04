class_name battle_foregroundUI
extends Node

var tileSelector:AnimatedSprite2D
var dialougeGui:CanvasGroup
var dialogueLabel:Label
var inputCooldownTimer:Timer
var sceneTransitionTimer:Timer #TODO: make this a global timer that tracks transitions


var selectorMovementlocked:bool = true
var select
var selectorPosition:battleScene.battlePositions = 0 #starts innerLeft
var parentBattleSystem

signal tileSelected_placeFigment

var globalSceneTransitionTimer:Node

func _ready():
	globalSceneTransitionTimer = get_node("/root/GlobalSceneTransitionTimer")

func loadBattleUI():
	parentBattleSystem = get_parent()
	print(self.get_child_count())
	for child in self.get_children():
		if child is AnimatedSprite2D:
			tileSelector = child
		elif child is CanvasGroup:
			dialougeGui = child
			dialogueLabel = self.find_child("Label")
		elif child is Timer:
			inputCooldownTimer = child
		
	
	tileSelector.position = parentBattleSystem.figmentPositions[4 + selectorPosition]
			
func selectTile(displayText:String = "Please Select Tile"):
	dialogueLabel.text = displayText
	dialogueLabel.visible = true
	tileSelector.visible = true
	selectorMovementlocked = false
	#unlock selector
	
		
func _process(delta: float) -> void:
	#print("is stopped: " + str(inputCooldownTimer.is_stopped()))
	if selectorMovementlocked || not inputCooldownTimer.is_stopped() :
		return
	if Input.is_action_pressed("keyboard_interact") && globalSceneTransitionTimer.is_stopped():
		inputCooldownTimer.start()
		selectorMovementlocked = true
		tileSelector.visible = false
		dialogueLabel.visible = false
		tileSelected_placeFigment.emit(selectorPosition + 4)
		return
	if Input.is_action_pressed("keyboard_up") || Input.is_action_pressed("keyboard_down"):
		inputCooldownTimer.start()
		selectorPosition = selectorPosition + selectorCalMovement(selectorPosition) # code that swaps the vertical position enum
		tileSelector.position = parentBattleSystem.figmentPositions[4 + selectorPosition]
		print("up/down. position: " + str(selectorPosition))
	if Input.is_action_pressed("keyboard_left") || Input.is_action_pressed("keyboard_right"):
		inputCooldownTimer.start()
		selectorPosition = selectorPosition + 2 * selectorCalMovement(selectorPosition / 2)
		tileSelector.position = parentBattleSystem.figmentPositions[4 + selectorPosition]
		print("left/right. position: " + str(selectorPosition))

# somewhat complicated function
# basically we need to alternate whether we are adding  or subtracting a position
# because we want to be able to wrap around the array [0,1,2,3]
# in some examples, we want a 1 input to give 0, and 0 to give 1
# hence we have a modulo operation that controls a negative int
func selectorCalMovement(position:int):
	#var temp = position % 2
	#var temp2 = temp * -2
	var positionDiff = 1 + (-2 * (position % 2))
	return positionDiff
	
