extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	var dia2 = get_node("dialouge_2")
	dia2.set_visible(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_response_button_pressed():
	var dia1 = get_node("dialouge_1")
	var response_button = get_node("response_button")
	var dia2 = get_node("dialouge_2")
	dia1.set_visible(false) 
	response_button.set_visible(false)
	dia2.set_visible(true)
	await get_tree().create_timer(5).timeout 
	dia2.set_visible(false)
	
