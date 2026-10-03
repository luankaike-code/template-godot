@tool
class_name ComponentMove extends Component

signal body_changed()

@export var speed: float = 500.0

@export var body: CharacterBody2D:
	set(new_body):
		body = new_body
		body_changed.emit()

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	Editor.is_

func tick() -> void:
	if !body:
		print("ComponentMove: Body not defined")

	body.velocity = direction * speed
	body.move_and_slide()
