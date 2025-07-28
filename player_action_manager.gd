extends Node
class_name PlayerActionManager

var is_performing_action: bool = false
var selected_action: BaseAction

func _unhandled_input(event: InputEvent) -> void:
	if is_performing_action:
		return
	
	if event.is_action_pressed("left_mouse_click"):
		if not GridManager:
			push_error("Unit: GridManager is null")
			return
		
		# 获取鼠标的世界坐标
		var mouse_world_position = GridManager.get_mouse_world_position()
		var mouse_grid_position = GridManager.get_mouse_grid_position()
		
		# 将网格坐标转换回世界坐标作为目标
		target_global_position = GridManager.get_world_position(mouse_grid_position)
		is_performing_action = true
		action_manager.get_action("move_action").start_action(mouse_grid_position, on_action_finished)
	
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
