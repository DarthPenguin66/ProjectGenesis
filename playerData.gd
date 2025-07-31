extends Node
'''
func _ready():
	
	#load data from disk if we need it
'''
var test:FigmentData

var figmentTeam:Array[figment] = []

var debugTeam:Array[String] = ["res://resources/Figments/iceBird.tres","res://resources/Figments/fireAss.tres"]
var debugLevel:int = 10
var loopIterator:int = 0
func _ready():
	for debugFigment in debugTeam:
		print(debugFigment)
		var figmentResource = load(debugFigment)
		figmentTeam.append(figment.new(figmentResource, debugLevel))
		print(figmentTeam[loopIterator].nickName)
