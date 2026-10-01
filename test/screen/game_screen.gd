extends Screen

@onready var button: Button = $Button

func _ready() -> void:
	button.pressed.connect(goto_menu)

func goto_menu():
	change_screen.emit(ScreensConfig.Id.Menu)
