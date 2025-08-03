class_name figmentMoves
extends Resource

#Ui section
@export var name:String = ""
@export var menuSprite:Texture2D
@export var description:String = ""

#mechanic section
@export var power:int = 0
@export var hitPercentage:int = 100
#@export var targetArea: #make this an enum for the options
@export var coolDownTurns:int = 0
@export var isUtility:bool = false
#@export var moveType: should be an enum if we can, maybe a resource otherwise
#@export var damageType # see above
#@export var damageType: should be an enum if we can, maybe a resource otherwise
#@export var terrainCreation #needs clarification on if this is a bool (does this make terrain) or specific terrain to be created (this makes X terrain)
#@export var isEsoteric/Natural: #will be an enum or a bool, since there are two options
