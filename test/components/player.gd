extends CharacterBody2D

@onready var component_input: ComponentInput = $ComponentInput
@onready var component_move: ComponentMove = $ComponentMove
@onready var component_health: ComponentHealth = %ComponentHealth
@onready var component_interator: ComponentInterator = $ComponentInterator
@onready var component_inventory: ComponentInventory = $ComponentInventory

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
	
	if component_input.action_1_pressed && component_input.action_2_pressed:
		drop_all_items()
	elif component_input.action_1_pressed:
		component_health.heal(5)
	elif component_input.action_2_pressed:
		component_health.take_damage(5)
	elif component_input.action_3_pressed:
		_interate()
	
	component_move.direction = component_input.move_dir
	component_move.tick()

func drop_all_items() -> void:
	var i: int = 1
	for item_index in component_inventory.inventory_storage:
		i += 1
		var item: ComponentItem = component_inventory.remove_item(item_index)
		var item_parent: Node2D = item.get_parent()
		item_parent.global_position = global_position + Vector2(10, 10) * i

func _interate() -> void:
	var interation := component_interator.get_interation()
	
	if !interation:
		return
		
	var interation_parent := interation.get_parent()
	
	if interation_parent is Item:
		var component_item: ComponentItem = interation_parent.pick_up()
		component_inventory.stock_up(component_item, 2)
	else:
		interation.interate()
