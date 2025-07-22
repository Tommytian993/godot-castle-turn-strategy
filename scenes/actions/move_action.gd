extends BaseAction
class_name MoveAction

var path: Array[Vector2]
var move_speed: float = 100.0

func start_action(target_grid_position: Vector2i, on_action_finished: Callable) -> void:
	super.start_action(target_grid_position, on_action_finished)
	# 获取从当前单位位置到目标网格的世界坐标路径
	path = GridManager.get_nav_world_path(unit.global_position, GridManager.get_world_position(target_grid_position))

func move(target_world_position: Vector2, delta: float) -> void:
	# 向目标世界坐标移动
	unit.global_position = unit.global_position.move_toward(target_world_position, move_speed * delta)

func _process(delta: float) -> void:
	# 如果技能没激活，则返回
	if not is_active:
		return
	# 如果路径存在且不为空
	if path and not path.is_empty():
		move(path[0], delta)
		# 距离足够近则移除该点
		if unit.global_position.distance_to(path[0]) < 1.0:
			path.remove_at(0)
	# 如果路径为空，则完成动作
	else:
		finish_action()
