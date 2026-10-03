class_name ComponentItem extends Component

@export var item_name: String = "ItemNotNamed!!!"

signal current_state_changed()

@export var current_state: ItemsConfig.ItemStates :
	set(new_current_state):
		if current_state == new_current_state:
			return
		
		current_state = new_current_state
		current_state_changed.emit()
