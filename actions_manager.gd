extends Node
class_name ActionsManager

var actions: Array[BaseAction] # all user skills

func _ready() -> void:
	for action: BaseAction in get_children():
		actions.append(action)

func get_action(action_id: String) -> BaseAction:
	var results = actions.filter(func(action: BaseAction) -> bool:
		return action.action.id == action_id
	)
	return results[0] if results.size() > 0 else null