extends Node2D

@export_category("Refs")
@export var clips: Array[AudioStream]

@export_category("Variables")
@export_range(0.0, 0.1, 0.005) var pitch_var: float = 1.0

var audioPlayer: AudioStreamPlayer

func _ready():
	audioPlayer = get_node("../AudioStreamPlayer")

func play():
	var index = randi() % clips.size()
	audioPlayer.stream = clips[index]
	audioPlayer.pitch_scale = randf_range(1.0 - pitch_var, 1.0 + pitch_var)
	audioPlayer.play()
