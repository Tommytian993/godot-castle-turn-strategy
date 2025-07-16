extends Node
var nav_layer: NavLayer

func get_grid_position(world_position: Vector2) -> Vector2i:
	if not nav_layer:
		push_error("GridManager: nav_layer is null")
		return Vector2i.ZERO
	return nav_layer.local_to_map(nav_layer.to_local(world_position))

func get_world_position(grid_position: Vector2i) -> Vector2:
	if not nav_layer:
		push_error("GridManager: nav_layer is null")
		return Vector2.ZERO
	return nav_layer.to_global(nav_layer.map_to_local(grid_position))

func get_mouse_world_position() -> Vector2:
	if not nav_layer:
		push_error("GridManager: nav_layer is null")
		return Vector2.ZERO
	return nav_layer.get_global_mouse_position()

func get_mouse_grid_position() -> Vector2i:
	return get_grid_position(get_mouse_world_position())

func get_nav_grid_path(start_grid_position: Vector2i, end_grid_position: Vector2i) -> Array[Vector2i]:
	if not nav_layer or not nav_layer.a_star:
		push_error("GridManager: nav_layer or a_star is null")
		return []
		
	if not nav_layer.a_star.is_in_bounds(start_grid_position.x, start_grid_position.y) or not nav_layer.a_star.is_in_bounds(end_grid_position.x, end_grid_position.y):
		push_error("Pathfinding point out of bounds: start=%s, end=%s" % [start_grid_position, end_grid_position])
		return []
	
	if not is_valid_grid(start_grid_position) or not is_valid_grid(end_grid_position):
		push_error("Pathfinding grid is not valid: start=%s, end=%s" % [start_grid_position, end_grid_position])
		return []
	
	return nav_layer.a_star.get_id_path(start_grid_position, end_grid_position)

func get_nav_world_path(start_world_position: Vector2, end_world_position: Vector2) -> Array[Vector2]:
	# 将世界坐标转换为网格坐标
	var start_grid = get_grid_position(start_world_position)
	var end_grid = get_grid_position(end_world_position)
	
	print("Start world: ", start_world_position, " -> grid: ", start_grid)
	print("End world: ", end_world_position, " -> grid: ", end_grid)
	
	var grid_path := get_nav_grid_path(start_grid, end_grid)
	var world_path: Array[Vector2] = []
	for grid_position in grid_path:
		world_path.append(get_world_position(grid_position))
	return world_path

func is_valid_grid(grid_position: Vector2i) -> bool:
	return nav_layer.grid_data_dict.has(grid_position)

func is_grid_walkable(grid_position: Vector2i) -> bool:
	if not is_valid_grid(grid_position):
		return false
	return nav_layer.grid_data_dict[grid_position].walkable

func set_grid_walkable(grid_position: Vector2i, walkable: bool) -> void:
	if not is_valid_grid(grid_position):
		push_error("GridManager: grid_position is not valid: %s" % [grid_position])
		return
	nav_layer.grid_data_dict[grid_position].walkable = walkable

func is_grid_occupied(grid_position: Vector2i) -> bool:
	if not is_valid_grid(grid_position):
		return false
	return nav_layer.grid_data_dict[grid_position].occupied_unit != null

func get_grid_occupied(grid_position: Vector2i) -> Unit:
	if not is_valid_grid(grid_position):
		return null
	return nav_layer.grid_data_dict[grid_position].occupied_unit