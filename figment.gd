class_name figment
extends Node

@export var figmentSpecies:FigmentData
@export var nickName:String

@export var currentLevel:int

@export var maxHealth:int
@export var currentHealth:int
@export var currentPower:int
@export var currentDefense:int
@export var currentResilience:int
@export var currentSpeed:int

@export var currentMoves:Array[figmentMoves]

@export var currentStatus:Array #TODO: need to find out if statuses are exclusive from each other
@export var currentAbility:FigmentAbility

func _init(species:FigmentData, level:int, figmentAbility:FigmentAbility = null, moves:Array[figmentMoves]=[], nickName:String=""):
	figmentSpecies = species
	currentLevel = level
	currentMoves = moves
	currentAbility = figmentAbility
	if nickName.is_empty():
		nickName = figmentSpecies.species_name
		
	maxHealth = floor(figmentSpecies.health_percent * 0.01 * (50 + 19 * currentLevel))
	currentPower = floor(figmentSpecies.power_percent * 0.01 * (50 + 19 * currentLevel))
	currentDefense = floor(figmentSpecies.defense_percent * 0.01 * (50 + 19 * currentLevel))
	currentResilience = floor(figmentSpecies.resilience_percent * 0.01 * (50 + 19 * currentLevel))
	currentSpeed = floor(figmentSpecies.speed_percent * 0.01 * (50 + 19 * currentLevel))

	currentHealth = maxHealth
