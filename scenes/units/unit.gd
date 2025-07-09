extends Node2D
class_name Unit

var target_global_position: Vector2i
var move_speed: float = 100.0
var grid_position: Vector2i:
	get: return GridManager.get_grid_position(global_position)

var path: Array[Vector2]

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse_click"):
		var mouse_grid_position := GridManager.get_mouse_grid_position()
		target_global_position = GridManager.get_world_position(mouse_grid_position)
		GridManager.get_nav_world_path(global_position, target_global_position)

func _process(delta: float) -> void:
	if path and not path.is_empty():
		move(path[0], delta)
		if global_position == path[0]:
			path.remove_at(0)

func move(target_position: Vector2, delta: float) -> void:
	global_position = global_position.move_toward(target_position, move_speed * delta)
