class_name GridData

var walkable: bool = true
var occupied_unit: Unit = null

# Returns true if the grid is occupied by a unit
func is_occupied_by_unit() -> bool:
	return occupied_unit != null
