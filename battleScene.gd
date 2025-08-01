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

const figmentPosition_enemy_inner_left:Transform2D = Transform2D(0,Vector2(-75,25)) #  	Transform2D(rotation: float, position: Vector2)
const figmentPosition_enemy_inner_right:Transform2D = Transform2D(0,Vector2(75,25))
const figmentPosition_enemy_outer_left:Transform2D = Transform2D(0,Vector2(-75,-75))
const figmentPosition_enemy_outer_right:Transform2D = Transform2D(0,Vector2(75,-75))

const figmentPosition_ally_inner_left:Transform2D = Transform2D(0,Vector2(-75,125))
const figmentPosition_ally_inner_right:Transform2D = Transform2D(0,Vector2(75,125))
const figmentPosition_ally_outer_left:Transform2D = Transform2D(0,Vector2(-75,225))
const figmentPosition_ally_outer_right:Transform2D = Transform2D(0,Vector2(75,225))

var figmentPositions:Array[Transform2D] = [
	figmentPosition_enemy_inner_left,
	figmentPosition_enemy_inner_right,
	figmentPosition_enemy_outer_left,
	figmentPosition_enemy_outer_right,
	figmentPosition_ally_inner_left,
	figmentPosition_ally_inner_right,
	figmentPosition_ally_outer_left,
	figmentPosition_ally_outer_right]

func _ready():

	if battleInput:
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
				
	if alliedBattlers.size() != 2 or enemyBattlers.size() != 2:
		OS.alert("wrong number of battlers in battlescene. ", "ALERT") 
		
	#add figments to battlers
	enemyBattlers[0].add_child(enemyTeam[0])
	enemyBattlers[1].add_child(enemyTeam[1])
	alliedBattlers[0].add_child(PlayerData.figmentTeam[0])
	alliedBattlers[1].add_child(PlayerData.figmentTeam[1])
	
	#place the figments in scene
