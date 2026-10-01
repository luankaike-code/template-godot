extends State

@onready var move_state: State = $"../Move"

var master: Player

func _state_enter(master_: Node) -> void:
	master = master_
	master.modulate = Color(1.0, 0.0, 0.0, 1.0)

func _state_physics_process(_delta: float) -> void:
	var direction : Vector2 = master.get_direction()
	
	if direction == Vector2.ZERO:
		master.velocity.x = move_toward(master.velocity.x, 0, master.SPEED/2)
		master.velocity.y = move_toward(master.velocity.y, 0, master.SPEED/2)
	else:
		change_state.emit(move_state)
	
	master.move_and_slide()
