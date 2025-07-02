extends Node
var nav_layer: TileMapLayer

func get_grid_position(world_position: Vector2) -> Vector2i:
	return nav_layer.local_to_map(nav_layer.to_local(world_position))

func get_world_position(grid_position: Vector2i) -> Vector2:
	return nav_layer.to_global(nav_layer.map_to_local(grid_position))
