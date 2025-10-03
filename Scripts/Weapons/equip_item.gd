class_name EquipItem
extends Node2D

# 装备使用频率（冷却时间）
@export var use_rate: float = 0.5
# 上次使用时间
var last_use_time: float
# 瞄准角度
var aim_angle: float
# 装备的拥有者角色
var owner_character: Character
# 是否可以使用
var can_use: bool = true

func _process(delta: float):
	# 平滑旋转到瞄准角度
	global_rotation = lerp_angle(global_rotation, aim_angle, 4)

func set_aim_direction(aim_dir: Vector2):
	# 设置瞄准方向，将Vector2转换为角度
	aim_angle = aim_dir.angle()

func _equip():
	# 装备时的逻辑
	pass

func _unequip():
	# 卸下装备时的逻辑
	pass

func _try_use() -> bool:
	# 检查是否可以使用
	if not can_use:
		return false
	# 检查冷却时间是否已过
	if Time.get_unix_time_from_system() - last_use_time < use_rate:
		return false
	# 更新使用时间
	last_use_time = Time.get_unix_time_from_system()
	# 执行使用逻辑
	_use()
	return true

func _use():
	# 实际使用装备的逻辑
	pass