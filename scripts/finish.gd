class_name Finish
extends Area2D

var victory_timer = 0

func _physics_process(delta):
	if get_overlapping_bodies().size() > 0:
		victory_timer += delta
		if victory_timer > 2:
			SignalBus.on_level_finished.emit()
	else:
		victory_timer = 0
