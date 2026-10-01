extends Screen

@onready var button: Button = $Button
@onready var button_2: Button = $Button2

func _ready() -> void:
	button.pressed.connect(goto_game)
	button_2.pressed.connect(quit.emit)

func goto_game():
	change_screen.emit(ScreensConfig.Id.Game)
