class_name genericBattler
extends Node

#TODO add scripts to battlers? they may need figment data to hold. Im not sure
#TODO add 



var figmentInBattle:figment = null
var battlePosition:battleScene.battlePositions

func loadFigmentBattler(inputFigment:figment):
	self.add_child(inputFigment)
#func _ready():
		#load player data
		#load previous scene data ie. why we entered a battle and what scenario to load
		
