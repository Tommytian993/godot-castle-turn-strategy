class_name Player
extends Character




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_input = Input.get_vector("move_up", "move_down", "move_left", "move_right")
