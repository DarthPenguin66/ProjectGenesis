class_name FigmentData
extends Resource

@export var species_name: String = ""

#stats are a percantage of the total. example: 20 would be 20%. all values should add up to 100
@export var health_percent: int = 0
@export var power_percent: int = 0
@export var defense_percent: int = 0
@export var resilience_percent: int = 0
@export var speed_percent: int = 0

#needs 2 abilities per figment
#need move list of 12 per mon
#need two art's. full art and pixel art (also might need a back sprite for battles)
#need to add type
