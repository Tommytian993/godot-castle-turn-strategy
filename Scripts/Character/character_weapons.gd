class_name CharacterWeapons
extends Node2D

@export var weapon_to_equip: PackedScene
var current_weapon: Weapon
@onready var character: Character = $".."

func _ready():
	pass

func equip_weapon(weapon_scene: PackedScene):
	pass

func unequip_weapon():
	pass