class_name battleScene
extends Node


#@export var previousSceneInformation
#TODO: need to figure out how to store data from previous scene and how to best transition back after a battle

var battle_input:battleInput=null
var debugTeam:Array[String] = ["res://resources/Figments/iceBird.tres","res://resources/Figments/fireAss.tres"]
var debugLevel:int
var enemyTeam:Array[figment]=[]
enum battlePositions{innerLeft, outerLeft, outerRight, innerRight}
var alliedBattlers:Array[genericBattler] = []
var enemyBattlers:Array[genericBattler] = []

func _ready():
	if battleInput:
		for fig in debugTeam:
			var figmentResource = load(fig)
			enemyTeam.append(figment.new(figmentResource, debugLevel))
	for child in get_children():
		if child is genericBattler:
			if "Allied" in child.name:
				alliedBattlers.append(child)
			elif "Enemy" in child.name:
				enemyBattlers.append(child)
				
	if alliedBattlers.size() != 2 or enemyBattlers.size() != 2:
		OS.alert("wrong number of battlers in battlescene. ", "ALERT") 
		
	enemyBattlers[0].add_child(enemyTeam[0])
	enemyBattlers[1].add_child(enemyTeam[1])
	alliedBattlers[0].add_child(PlayerData.figmentTeam[0])
	alliedBattlers[1].add_child(PlayerData.figmentTeam[1])
