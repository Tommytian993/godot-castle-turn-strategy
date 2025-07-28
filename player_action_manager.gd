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

func on_action_finished() -> void:
	is_performing_action = false
