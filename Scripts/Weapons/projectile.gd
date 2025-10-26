class_name Projectile
extends Area2D

@export var damage: int = 1
@export var speed: float = 50
@export var hit_force: float = 30

var owner_character: Character

func initialize(owner_character: Character):
	pass

func _process(delta: float):
	pass


func _on_body_entered(body: Node2D) -> void:
	pass