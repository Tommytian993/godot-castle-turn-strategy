extends Node2D

var mouse_grid_position: Vector2i

func _process(_delta: float) -> void:
    var new_mouse_grid_position = GridManager.get_mouse_grid_position()
    if new_mouse_grid_position != mouse_grid_position:
        mouse_grid_position = new_mouse_grid_position
        # 将网格指示器移动到鼠标所在的网格位置
        global_position = GridManager.get_world_position(mouse_grid_position)
