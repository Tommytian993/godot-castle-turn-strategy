extends Node
class_name PlayerActionManager

var is_performing_action: bool = false
var selected_action: BaseAction

func set_selected_action(action: BaseAction) -> void:
	if is_performing_action:
		return
	if selected_action == action:
		return
	print("Select " + action.action_name)
	selected_action = action

func try_perform_selected_action() -> void:
	if is_performing_action:
		return
	if selected_action == null:
		return
	var target_grid_position: Vector2i = GridManager.get_mouse_grid_position()
	is_performing_action = true
	selected_action.start_action(target_grid_position, on_action_finished)

func on_action_finished() -> void:
	is_performing_action = false
