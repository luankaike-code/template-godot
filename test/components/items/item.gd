class_name Item extends Node2D

@export var component_item: ComponentItem

func _ready() -> void:
	assert(!component_item, "Critic error: component_item not found (Item)")

func pick_up() -> ComponentItem:
	return component_item
