extends Node
var nav_layer: NavLayer

func get_grid_position(world_position: Vector2) -> Vector2i:
	return nav_layer.local_to_map(nav_layer.to_local(world_position))

func get_world_position(grid_position: Vector2i) -> Vector2:
	return nav_layer.to_global(nav_layer.map_to_local(grid_position))

func get_mouse_world_position() -> Vector2:
	return nav_layer.get_global_mouse_position()

func get_mouse_grid_position() -> Vector2i:
	return get_grid_position(get_mouse_world_position())

func get_nav_grid_path(start_grid_position: Vector2i, end_grid_position: Vector2i) -> Array[Vector2i]:
	return nav_layer.a_star.get_id_path(start_grid_position, end_grid_position)

func get_nav_world_path(start_world_position: Vector2, end_world_position: Vector2) -> Array[Vector2]:
	var grid_path := get_nav_grid_path(start_world_position, end_world_position)
	var world_path: Array[Vector2] = []
	for grid_position in grid_path:
		world_path.append(get_world_position(grid_position))
	return world_path
