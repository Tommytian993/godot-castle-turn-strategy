class_name MeleeWeapon
extends Weapon

@export var damage: int
@export var hit_force: float

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var hit_box: Area2D = $HitBox

func _use():
	anim.play("attack")

func detect_hits():
	print("=== HIT DETECTION DEBUG ===")
	print("Checking for overlapping bodies...")
	for body in hit_box.get_overlapping_bodies():
		print("Found body: ", body.name, " (", body.get_class(), ")")
		if body == owner_character:
			print("Skipping owner character")
			continue
		if body is not Character:
			print("Skipping non-Character: ", body.get_class())
			continue
		print("Hitting Character: ", body.name)
		var direction: Vector2 = global_position.direction_to(body.global_position)
		body.take_damage(damage, direction * hit_force)
