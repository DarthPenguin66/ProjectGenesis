class_name battleScene
extends Node


#@export var previousSceneInformation
#TODO: need to figure out how to store data from previous scene and how to best transition back after a battle

var playerData:Node

var battle_input:battleInput=null
var debugTeam:Array[String] = ["res://resources/Figments/iceBird.tres","res://resources/Figments/fireAss.tres"]
var debugLevel:int = 5
var enemyTeam:Array[figment]=[]
enum battlePositions{innerLeft, outerLeft, innerRight, outerRight}
var alliedBattlers:Array[genericBattler] = []
var enemyBattlers:Array[genericBattler] = []

const figmentPosition_enemy_inner_left:Vector2 = Vector2(-75,25) #  	Transform2D(rotation: float, position: Vector2)
const figmentPosition_enemy_outer_left:Vector2 = Vector2(-75,-75)
const figmentPosition_enemy_inner_right:Vector2 = Vector2(75,25)
const figmentPosition_enemy_outer_right:Vector2 = Vector2(75,-75)

const figmentPosition_ally_inner_left:Vector2 = Vector2(-75,125)
const figmentPosition_ally_outer_left:Vector2 = Vector2(-75,225)
const figmentPosition_ally_inner_right:Vector2 = Vector2(75,125)
const figmentPosition_ally_outer_right:Vector2 = Vector2(75,225)

var figmentPositions:Array[Vector2] = [
	figmentPosition_enemy_inner_left,
	figmentPosition_enemy_outer_left,
	figmentPosition_enemy_inner_right,
	figmentPosition_enemy_outer_right,
	figmentPosition_ally_inner_left,
	figmentPosition_ally_outer_left,
	figmentPosition_ally_inner_right,
	figmentPosition_ally_outer_right]

func _ready():

	#get player data
	playerData = get_node("/root/PlayerData")

	#if battleInput:
	for fig in debugTeam:
		var figmentResource = load(fig)
		enemyTeam.append(figment.new(figmentResource, debugLevel))
			
	for child in get_children():
		#battle ui child
		if child is battle_bakcgroundUI:
			child.loadBattleUI()
		#battler child	
		elif child is genericBattler:
			if "Allied" in child.name:
				alliedBattlers.append(child)
			elif "Enemy" in child.name:
				enemyBattlers.append(child)
			
			child.readyBattler()
				
	if alliedBattlers.size() != 2 or enemyBattlers.size() != 2:
		OS.alert("wrong number of battlers in battlescene. ", "ALERT") 
		
	
	#load the figments
	enemyBattlers[0].loadFigmentBattler(enemyTeam[0])
	enemyBattlers[1].loadFigmentBattler(enemyTeam[1])
	alliedBattlers[0].loadFigmentBattler(playerData.figmentTeam[0])
	alliedBattlers[1].loadFigmentBattler(playerData.figmentTeam[1])
	
	#place the figments in scene
	var validPositions = [0,1,2,3]
	var position1:int = -1
	var position2:int = -1
	#random figment placement
	while position1 == position2 || position2 ==-1:
		position1 = validPositions.pick_random()
		position2 = validPositions.pick_random()
	var randomPosition = validPositions.pick_random()
	enemyBattlers[0].moveBattler(position1)
	enemyBattlers[1].moveBattler(position2)
	
