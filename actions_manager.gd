extends Node
class_name ActionsManager

var actions: Array[BaseAction] # all user skills

func _ready() -> void:
	for action: BaseAction in get_children():
		actions.append(action)

func get_action(action_id: String) -> BaseAction:
	# Filter actions array to find action with matching action_id
	var results = actions.filter(func(action: BaseAction) -> bool:
		return action.action_id == action_id
	)
	# Return the first matching action, or null if not found
	return results[0] if results.size() > 0 else null
