class_name Player
extends Character


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_input = Input.get_vector("move_up", "move_down", "move_left", "move_right")
