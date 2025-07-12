extends Node2D
class_name Unit

var target_global_position: Vector2
var move_speed: float = 100.0
var grid_position: Vector2i:
	get:
		if not GridManager:
			return Vector2i.ZERO
		return GridManager.get_grid_position(global_position)

var path: Array[Vector2]

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse_click"):
		if not GridManager:
			push_error("Unit: GridManager is null")
			return
		
		# 获取鼠标的世界坐标
		var mouse_world_position = GridManager.get_mouse_world_position()
		var mouse_grid_position = GridManager.get_mouse_grid_position()
		
		# 将网格坐标转换回世界坐标作为目标
		target_global_position = GridManager.get_world_position(mouse_grid_position)
		
		# 计算路径
		path = GridManager.get_nav_world_path(global_position, target_global_position)
		
		print("Mouse world pos: ", mouse_world_position)
		print("Mouse grid pos: ", mouse_grid_position)
		print("Target world pos: ", target_global_position)
		print("Path: ", path)

func _process(delta: float) -> void:
	if path and not path.is_empty():
		move(path[0], delta)
		if global_position.distance_to(path[0]) < 1.0:
			path.remove_at(0)

func move(target_position: Vector2, delta: float) -> void:
	global_position = global_position.move_toward(target_position, move_speed * delta)
