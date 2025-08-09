class_name genericBattler
extends Node

#TODO add scripts to battlers? they may need figment data to hold. Im not sure
#TODO add 

var ActiveBattleScene:battleScene 

var figmentInBattle:figment = null
var battlePosition:battleScene.battlePositions = ActiveBattleScene.battlePositions.NONE
var battleSprite:Sprite2D 
var isPlaced:bool = false
var isAlly:bool = false

signal battlerMoved(battler:genericBattler,newLocation:battleScene.battlePositions)

func readyBattler():
	ActiveBattleScene = self.get_parent()
	battleSprite = self.get_child(0)
	battleSprite.visible = false

func loadFigmentBattler(inputFigment:figment):
	figmentInBattle = inputFigment
	figmentInBattle.printData()
	battleSprite.set_texture(figmentInBattle.figmentSpecies.battleSprite)
	
func moveBattler(positionToMoveTo:battleScene.battlePositions):
	
	#8 is the size of the battle positions array. If we are bigger than it, or smaller than 0, we have a NONE position
	if positionToMoveTo > 8 || positionToMoveTo < 0:
		battleSprite.visible = false
		battlePosition = ActiveBattleScene.battlePositions.NONE
	else:
		battleSprite.visible = true
		battlePosition = positionToMoveTo
	battlerMoved.emit(self,battlePosition)
	battleSprite.position = ActiveBattleScene.figmentPositions[battlePosition]
	print("stop")
		
#func _ready():
		#load player data
		#load previous scene data ie. why we entered a battle and what scenario to load
		
