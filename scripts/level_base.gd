extends Node

@onready var player: Torso = get_node("Player")

var level_1 = preload("res://levels/level_1.tscn").instantiate()
var level_2 = preload("res://levels/level_2.tscn").instantiate()
var level_3 = preload("res://levels/level_3.tscn").instantiate()
var level_4 = preload("res://levels/level_4.tscn").instantiate()
var level_5 = preload("res://levels/level_5.tscn").instantiate()
var level_6 = preload("res://levels/level_6.tscn").instantiate()

var levels: Array[Node2D]
var current_level: Node2D

func _ready():
	init_levels()
	load_next_level()
	
	SignalBus.on_level_finished.connect(on_level_finished)

func init_levels():
	levels.append(level_1)
	levels.append(level_2)
	levels.append(level_3)
	levels.append(level_4)
	levels.append(level_5)
	levels.append(level_6)

func on_level_finished():
	get_tree().root.remove_child(current_level)
	load_next_level()

func load_next_level():
	if (levels.size() > 0):
		current_level = levels.pop_front()
		get_tree().root.add_child.call_deferred(current_level)
		
		player.global_position = current_level.get_node("SpawnPoint").global_position
