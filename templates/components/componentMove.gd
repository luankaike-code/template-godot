class_name ComponentMove extends Node

@export var speed: float = 500.0

@export var body: CharacterBody2D

var direction: Vector2 = Vector2.ZERO

func tick() -> void:
	if !body:
		print("ComponentMove: Body not defined")

	body.velocity = direction * speed
	body.move_and_slide()
