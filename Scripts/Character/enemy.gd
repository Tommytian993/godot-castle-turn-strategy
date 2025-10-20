class_name Enemy
extends Character

# 目标角色（通常是玩家）
@export var target: CharacterBody2D
# 停止距离，敌人会在这个距离内停止移动
@export var stop_distance: float = 28

# 朝向目标的方向向量
var target_direction: Vector2
# 到目标的距离
var target_distance: float

func _process(delta):
	# 如果没有目标则返回
	if not target: return
	# 计算朝向目标的方向
	target_direction = global_position.direction_to(target.global_position)
	# 计算到目标的距离
	target_distance = global_position.distance_to(target.global_position)
	
	# 设置朝向为朝向目标
	look_direction = target_direction
	
	# 如果距离大于停止距离，则向目标移动
	if target_distance > stop_distance:
		move_input = target_direction
	else:
		# 否则停止移动
		move_input = Vector2.ZERO

func _die():
	print("Enemy died! Remaining HP: ", cur_hp)
	queue_free()
