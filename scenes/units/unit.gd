extends Node2D
class_name Unit

var target_global_position: Vector2i
var move_speed: float = 100.0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse_click"):
		var mouse_grid_position := GridManager.get_mouse_grid_position()
		target_global_position = GridManager.get_world_position(mouse_grid_position)

func _process(delta: float) -> void:
	move(target_global_position, delta)
