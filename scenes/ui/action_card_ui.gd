extends Button
class_name ActionCardUI

var action: BaseAction

func set_up(action: BaseAction) -> void:
	self.action = action
	text = action.action_name
