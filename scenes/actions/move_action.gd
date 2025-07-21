extends BaseAction
class_name MoveAction

var path: Array[Vector2]
var move_speed: float = 100.0

func start_action(target_grid_position: Vector2i, on_action_finished: Callable) -> void:
	super.start_action(target_grid_position, on_action_finished)
	path = GridManager.get_nav_world_path(unit.grid_position, target_grid_position)
