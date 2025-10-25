extends CharacterBody2D
class_name Character

signal OnTakeDamage(direction: Vector2)
signal OnHealthChange

@export var cur_hp: int = 10
@export var max_hp: int = 10
@export var move_speed: float = 30
@export var force_drag: float = 5
@export var weight: float = 1.0

var move_input: Vector2
var look_direction: Vector2
var external_force: Vector2

func _physics_process(delta):
	_move(delta)

func _move(delta: float):
	external_force = external_force.lerp(Vector2.ZERO, force_drag * delta)
	velocity = move_input * move_speed
	velocity += external_force
	move_and_slide()

func take_damage(damage: int, force: Vector2):
	print("=== DAMAGE DEBUG ===")
	print("Character: ", name, " took ", damage, " damage")
	cur_hp -= damage
	print("Remaining HP: ", cur_hp)
	add_force(force)
	
	if cur_hp <= 0:
		print("Character ", name, " is dying!")
		_die()
	else:
		OnTakeDamage.emit(force)
		OnHealthChange.emit()

func _die():
	pass

func heal(amount: int):
	pass

func add_force(force: Vector2):
	external_force += force / weight
