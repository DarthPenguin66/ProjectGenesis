extends Node

var musicAudioplayer:AudioStreamPlayer
var soundEffectAudioplayer:AudioStreamPlayer

@export var errorSound:AudioStream

func _ready():
	for child in get_children():
		if child.name == "musicAudio":
			musicAudioplayer = child
		elif child.name == "soundEffectAudio":
			soundEffectAudioplayer = child
			soundEffectAudioplayer.stream.loop = false #if we dont set this, our sound effect will loop if it was imported with loop being set. kinda dumb


signal playErrorSound

func _playingErrorSound():
	soundEffectAudioplayer.stream = errorSound
	soundEffectAudioplayer.play()
