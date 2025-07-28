extends MarginContainer
class_name UnitActionsUI

@export var action_card_ui: PackedScene
#按住control 拖入
#onready is more safer, it will wait for node to be ready, and check type at compile time
@onready var action_container: HBoxContainer = $MarginContainer/ActionContainer
#没按control
#$MarginContainer/ActionContainer

func update_unit_actions_ui() -> void:
	#这里我们先假设只有一个unit，从tree中获取unit的ActionsManager
	var actions_manager: ActionsManager = get_tree().current_scene.get_node("Unit").get_node("ActionsManager")