class_name EnemyWeapons
extends CharacterWeapons

@onready var me: Enemy = $".."

func _process(delta: float):
	if not current_weapon:
		return
	
	var target_dir: Vector2 = global_position.direction_to(me.target.global_position)
	var target_dist: float = global_position.distance_to(me.target.global_position)
	
	current_weapon.set_aim_direction(target_dir)

	current_weapon._try_use()