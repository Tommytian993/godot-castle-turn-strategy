extends Node
class_name ActionsManager

var actions: Array[BaseAction] # all user skills

func _ready() -> void:
	for action: BaseAction in get_children():
		actions.append(action)
