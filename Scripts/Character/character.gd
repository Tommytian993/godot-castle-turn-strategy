extends CharacterBody2D
class_name Character

signal OnTakeDamage(direction: Vector2)
signal OnHealthChange

@export var cur_hp: int = 10
@export var max_hp: int = 10
@export var move_speed: float = 20
@export var force_drag: float = 5
@export var weight: float = 1.0

var move_input: Vector2
var look_direction: Vector2
var external_force: Vector2
