class_name Torso
extends RigidBody2D

var victory_timer = 0

@onready var music_player: AudioStreamPlayer = get_node("MusicPlayer")

func _process(delta):
	music_player.pitch_scale = 0.5 + absf(angular_velocity * 0.1);

func push(vector: Vector2):
	apply_impulse(vector)
	pass
