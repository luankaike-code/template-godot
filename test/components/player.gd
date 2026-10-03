extends CharacterBody2D

@onready var component_input: ComponentInput = $ComponentInput
@onready var component_move: ComponentMove = $ComponentMove
@onready var component_health: ComponentHealth = %ComponentHealth
@onready var component_interator: ComponentInterator = $ComponentInterator

func _ready() -> void:
	component_health.revived.connect(func(): print("revived"))
	component_health.died.connect(func(): print("deaded"))
	component_health.changed_health.connect(on_changed_health)

func on_changed_health() -> void:
	print("changed health - %d / %d / %d"  % \
		[
			component_health.current_health,
			component_health.max_health, 
			int(component_health.is_dead)
		]
	)

func _physics_process(_delta: float) -> void:
	component_input.update()
	
	if component_input.action_1_pressed:
		component_health.heal(5)
	if component_input.action_2_pressed:
		component_health.take_damage(5)
	if component_input.action_3_pressed:
		_interate()
	
	component_move.direction = component_input.move_dir
	component_move.tick()

func _interate() -> void:
	component_interator.interate()
