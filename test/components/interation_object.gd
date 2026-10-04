extends Node2D

@onready var component_interation: ComponentInteration = $ComponentInteration
@export var text: String

func _ready() -> void:
	component_interation.interated.connect(func(): print(text))
