class_name ScreensConfig extends Node

enum Id {
	Menu,
	Game
}

static var packeds: Dictionary[Id, PackedScene] = {
	Id.Menu: preload("res://test/screen/menuScreen.tscn"),
	Id.Game: preload("res://test/screen/gameScreen.tscn")
}
