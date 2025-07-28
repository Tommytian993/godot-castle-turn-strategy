extends Node2D
class_name Unit
var is_performing_action: bool = false
@onready var action_manager: ActionsManager = $ActionsManager

var target_global_position: Vector2
var grid_position: Vector2i:
	get:
		if not GridManager:
			return Vector2i.ZERO
		return GridManager.get_grid_position(global_position)

func on_action_finished() -> void:
	is_performing_action = false
