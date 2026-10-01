extends State

@onready var idle_state: State = $"../Idle"

var master: Player

func _state_enter(master_: Node) -> void:
	master = master_
	master.modulate = Color(1.0, 0.0, 1.0, 1.0)
	
func _state_physics_process(_delta: float) -> void:
	var direction : Vector2 = master.get_direction()
	
	if direction != Vector2.ZERO:
		master.velocity = direction * master.SPEED
	else:
		change_state.emit(idle_state)
	
	master.move_and_slide()
