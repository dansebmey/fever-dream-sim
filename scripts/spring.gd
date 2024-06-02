extends Node

signal s_push(float)

@export var MAX_JUMP_CHARGE = 0.5
@export var PUSH_FORCE: float = 500
@export var ANIM_NAME: String
var is_jump_charging = false
var has_shake_played = false
var jump_charge: float

@onready var torso: Torso = get_node("./../..")
@onready var animPlayer: AnimationPlayer = get_node("AnimationPlayer")
@onready var hitbox: Area2D = get_node("Hitbox")

func _process(delta):
	if is_jump_charging: jump_charge += delta
	if jump_charge > MAX_JUMP_CHARGE and !has_shake_played:
		animPlayer.play("shake")
		has_shake_played = true

func _input(event):
	if event.is_action_pressed(ANIM_NAME):
		is_jump_charging = true
	elif event.is_action_released(ANIM_NAME):
		if is_jump_charging: jump()

func jump():
	animPlayer.play("jump")

func push():
	var force = PUSH_FORCE * (0.25 + clamp(jump_charge * 1.5, 0.0, 0.75))
	if hitbox.get_overlapping_bodies().size() == 0: force *= 0.25
		
	torso.push((Vector2.LEFT * force).rotated(self.global_rotation))
	
	jump_charge = 0
	is_jump_charging = false
	has_shake_played = false
