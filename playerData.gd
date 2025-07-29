extends Node
'''
func _ready():
	
	#load data from disk if we need it
'''
var test:FigmentData

var figmentTeam = []

func _ready():
	figmentTeam.append(FigmentData.new("iceBird"))
	figmentTeam.append(FigmentData.new("fireAss"))
	for figment in figmentTeam:
		print(figment.species_name)
