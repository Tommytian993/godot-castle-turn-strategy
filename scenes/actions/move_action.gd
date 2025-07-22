extends BaseAction
class_name MoveAction

var path: Array[Vector2]
var move_speed: float = 100.0

func start_action(target_grid_position: Vector2i, on_action_finished: Callable) -> void:
	super.start_action(target_grid_position, on_action_finished)
	path = GridManager.get_nav_world_path(unit.grid_position, target_grid_position)

func move(target_position: Vector2, delta: float) -> void:
	unit.global_position = unit.global_position.move_toward(target_position, move_speed * delta)

func _process(delta: float) -> void:
	# 如果技能没激活，则返回
	if not is_active:
		return
	if path and not path.is_empty():
		move(path[0], delta)
		if unit.global_position.distance_to(path[0]) < 1.0:
			path.remove_at(0)
	# 如果路径为空，则完成动作
	else:
		finish_action()