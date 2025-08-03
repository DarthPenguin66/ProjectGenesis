class_name battle_backgroundUI
extends Node

var battlePositionNodes:Array[Sprite2D] = []

#TODO i should clean this up. We need a texture 2D, and this in multiple lines o
var positionSpriteImage:Image = Image.load_from_file("res://artDump/BattleSquare.png")
var parentBattleSystem

var loopIterator:int = 0
func loadBattleUI():
	parentBattleSystem = get_parent()
	
	#remember range doesnt include the final number itself. range(1,9) gives you 1 through 8 inclusive
	for i in range(1,9):
		var sprite = Sprite2D.new()
		add_child(sprite)
		battlePositionNodes.append((sprite))	
		
		sprite.position = parentBattleSystem.figmentPositions[loopIterator]
		sprite.texture = ImageTexture.create_from_image(positionSpriteImage)
		sprite.z_index = 1
		
		loopIterator = loopIterator + 1
	
	
