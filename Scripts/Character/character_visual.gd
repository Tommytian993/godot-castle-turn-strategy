class_name CharacterVisual
extends Sprite2D

@export var character: Character

@export var wobble_speed: float = 15
@export var wobble_amount: float = 5

func _ready():
	# 连接受击信号
	if character != null:
		character.OnTakeDamage.connect(_on_take_damage)

func _process(delta: float):
	# 检查 character 是否为空，避免错误
	if character == null:
		return
		
	# sprite flipping
	flip_h = character.look_direction.x < 0

	# move wobble
	var target_rot: float = 0
	if character.velocity.length() > 1:
		var time = Time.get_unix_time_from_system()
		target_rot = sin(time * wobble_speed) * wobble_amount

	rotation_degrees = lerpf(rotation_degrees, target_rot, delta * 20)

func _on_take_damage(hit_force: Vector2):
	print("DAMAGED")
	# 受击闪烁效果
	modulate = Color.BLACK
	await get_tree().create_timer(0.08).timeout
	modulate = Color.WHITE
