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

func get_nav_grid_path(start_position: Vector2i, end_position: Vector2i) -> Array[Vector2i]:
	return nav_layer.get_nav_grid_path(start_position, end_position)
