extends TileMapLayer
class_name NavLayer

var a_star: AStar2D

func _ready() -> void:
	GridManager.nav_layer = self
