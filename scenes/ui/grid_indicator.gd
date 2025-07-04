extends Node2D

var mouse_grid_position: Vector2i

func _process(_delta: float) -> void:
    var new_mouse_grid_position = GridManager.get_mouse_grid_position()
