class_name EquipItem
extends Node2D

@export var use_rate: float = 0.5
var last_use_time: float
var aim_angle: float
var owner_character: Character
var can_use: bool = true

func _process(delta: float):
	pass

func set_aim_direction(aim_dir: Vector2):
	pass

func _equip():
	pass

func _unequip():
	pass

func _try_use() -> bool:
	pass

func _use():
	pass