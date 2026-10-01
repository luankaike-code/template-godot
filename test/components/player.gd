extends CharacterBody2D

@onready var component_input: ComponentInput = $ComponentInput
@onready var component_move: ComponentMove = $ComponentMove
@onready var component_health: ComponentHealth = %ComponentHealth

func _ready() -> void:
	component_health.revived.connect(func(): print("revived"))
	component_health.died.connect(func(): print("deaded"))
	component_health.changed_health.connect(
		func(current_health: float, max_health: float, is_dead: bool): 
			print("changed health - %d / %d / %d" % [current_health, max_health, int(is_dead)])
	)

func _physics_process(_delta: float) -> void:
	component_input.update()
	
	if component_input.action_1_pressed:
		component_health.heal(5)
	if component_input.action_2_pressed:
		component_health.take_damage(5)
	component_move.direction = component_input.move_dir
	component_move.tick()
