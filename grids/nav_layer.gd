extends TileMap
class_name NavLayer

var a_star: AStarGrid2D
var grid_data_dict: Dictionary[Vector2i, GridData] = {}

func _ready() -> void:
	# 延迟初始化，确保tile_set已经加载
	call_deferred("initialize")
	GridManager.nav_layer = self

func initialize() -> void:
	if not tile_set:
		push_error("NavLayer: tile_set is null")
		return
		
	# # 添加一些测试瓦片
	# add_test_tiles()
	
	a_star = AStarGrid2D.new()
	
	# 检查是否有有效的tile数据
	var used_rect = get_used_rect()
	if used_rect.size == Vector2i.ZERO:
		# 如果没有tile数据，设置一个默认区域
		used_rect = Rect2i(0, 0, 10, 10)
		push_warning("NavLayer: No tiles found, using default region")
	
	a_star.region = used_rect
	a_star.cell_size = tile_set.tile_size
	a_star.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER

	a_star.update()

	var used_cells := get_used_cells(0) # 使用图层0
	for cell in used_cells:
		grid_data_dict[cell] = GridData.new()
		if not get_cell_tile_data(0, cell).get_custom_data("walkable"):
			a_star.set_point_solid(cell)
			grid_data_dict[cell].walkable = false

# func add_test_tiles() -> void:
# 	# 添加一个简单的测试网格
# 	for x in range(10):
# 		for y in range(10):
# 			set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0))
