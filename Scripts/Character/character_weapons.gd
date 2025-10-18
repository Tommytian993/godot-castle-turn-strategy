class_name CharacterWeapons
extends Node2D

@export var weapon_to_equip: PackedScene
var current_weapon: Weapon
@onready var character: Character = $".."

func _ready():
	if weapon_to_equip:
		equip_weapon(weapon_to_equip)

func equip_weapon(weapon_scene: PackedScene):
	if current_weapon:
		unequip_weapon()

	current_weapon = weapon_scene.instantiate()
	add_child(current_weapon)
	current_weapon.global_position = global_position

	current_weapon.owner_character = character
	current_weapon._equip()

func unequip_weapon():
	pass