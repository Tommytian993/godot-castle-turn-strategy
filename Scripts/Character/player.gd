class_name Player
extends Character


# 每帧调用。'delta' 是自上一帧以来经过的时间。
func _process(delta: float) -> void:
	# 从 WASD 键获取移动输入
	move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# 计算鼠标位置用于瞄准
	var mouse_pos: Vector2 = get_global_mouse_position()
	# 计算从玩家位置到鼠标光标的朝向
	look_direction = global_position.direction_to(mouse_pos)
