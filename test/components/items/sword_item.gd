extends Item

@onready var component_interation: ComponentInteration = $ComponentInteration

func _ready() -> void:
	component_item.current_state_changed.connect(set_visibility)

func set_visibility() -> void:
	var on_world = component_item.current_state == ItemsConfig.ItemStates.OnWorld
	print(on_world)
	visible = on_world
	component_interation.process_mode = Node.PROCESS_MODE_INHERIT if on_world else Node.PROCESS_MODE_DISABLED
