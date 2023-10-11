extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var dia1 = get_node("player_init_contact")
	var dia2 = get_node("air_com_response")
	var dia3 = get_node("player_message")
	var resp_button = get_node("resp_button")
	var dia4 = get_node("air_com_response_final")
	await get_tree().create_timer(3).timeout
	dia1.set_visible(true)
	dia2.set_visible(false)
	dia3.set_visible(false)
	resp_button.set_visible(false)
	dia4.set_visible(false)
	await get_tree().create_timer(5).timeout 
	dia1.set_visible(false)
	dia2.set_visible(true)
	await get_tree().create_timer(5).timeout
	resp_button.set_visible(true)
	
	#var dia1 = get_node("player_init_contact")
	#var dia2 = get_node("air_com_response")
	#var dia3 = get_node("player_message")
	#var resp_button = get_node("Button")
	#var dia4 = get_node("air_com_response_final")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var dia1 = get_node("player_init_contact")
	var dia2 = get_node("air_com_response")
	var dia3 = get_node("player_message")
	var resp_button = get_node("resp_button")
	var dia4 = get_node("air_com_response_final")
	#await get_tree().create_timer(5).timeout
	dia1.set_visible(false)
	dia2.set_visible(false)
	dia3.set_visible(true)
	resp_button.set_visible(false)
	await get_tree().create_timer(6).timeout
	dia3.set_visible(false)
	dia4.set_visible(true)
	await get_tree().create_timer(5).timeout
