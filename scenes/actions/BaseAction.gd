extends Node
class_name BaseAction

@export var action_id: String
@export var action_name: String

var unit: Unit
# since we are a turn base game
var is_active: bool = false

var on_action_finished: Callable

func _ready() -> void:
	# Set unit reference to the owner (parent Unit node)
	unit = owner

func start_action(target_grid_position: Vector2i, on_action_finished) -> void:
	is_active = true
	self.on_action_finished = on_action_finished
