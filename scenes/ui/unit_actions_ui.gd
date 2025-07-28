extends MarginContainer
class_name UnitActionsUI

@export var action_card_ui_scene: PackedScene
#按住control 拖入
#onready is more safer, it will wait for node to be ready, and check type at compile time
@onready var action_container: HBoxContainer = $MarginContainer/ActionContainer
#没按control
#$MarginContainer/ActionContainer

func _ready() -> void:
	#使用call_deferred，在所有unit都ready后更新UI
	call_deferred("update_unit_actions_ui")

func update_unit_actions_ui() -> void:
	#这里我们先假设只有一个unit，从tree中获取unit的ActionsManager
	var actions_manager: ActionsManager = get_tree().current_scene.get_node("Unit").get_node("ActionsManager")

	#在更新UI之前，先清空旧的按钮
	for node in action_container.get_children():
		#将每个节点标记为待删除，在下一帧删除
		node.queue_free()
	
	#为每个动作创建对应的UI按钮
	for action in actions_manager.actions:
		var action_card_ui: ActionCardUI = action_card_ui_scene.instantiate()
		action_container.add_child(action_card_ui)
		action_card_ui.set_up(action)