class_name genericBattler
extends Node

#TODO add scripts to battlers? they may need figment data to hold. Im not sure
#TODO add 

var ActiveBattleScene:battleScene 

var figmentInBattle:figment = null
var battlePosition:battleScene.battlePositions = ActiveBattleScene.battlePositions.NONE
var battleSprite:Sprite2D 

func readyBattler():
	ActiveBattleScene = self.get_parent()
	battleSprite = self.get_child(0)
	battleSprite.visible = false

func loadFigmentBattler(inputFigment:figment):
	figmentInBattle = inputFigment
	figmentInBattle.printData()
	battleSprite.set_texture(figmentInBattle.figmentSpecies.battleSprite)
	
func moveBattler(positionToMoveTo:battleScene.battlePositions):
	battlePosition = positionToMoveTo
	if battlePosition == ActiveBattleScene.battlePositions.NONE:
		battleSprite.visible = false
	else:
		battleSprite.visible = true
	battleSprite.position = ActiveBattleScene.figmentPositions[battlePosition]
	print("stop")
		
#func _ready():
		#load player data
		#load previous scene data ie. why we entered a battle and what scenario to load
		
