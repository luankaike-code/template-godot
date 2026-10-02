class_name ComponentInterator extends ComponentArea2D

func interate() -> void:
	var areas2D: Array[Area2D] = self.get_overlapping_areas()
	var interation_areas: Array[ComponentInteration]
	
	for area2D in areas2D:
		if area2D is ComponentInteration:
			interation_areas.append(area2D)
	
	if interation_areas.is_empty():
		print("No have InterationArea overlapping")
		return
	
	var interation_area: ComponentInteration = HelperNode2D.get_nearest_node(
		self.global_position,
		interation_areas
	)
	
	interation_area.interate()
