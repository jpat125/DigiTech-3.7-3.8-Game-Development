extends Control

# text to be typed out in old computer/typerwriter style
var pargraph = ("[center][b]Mission Failed![/b]

You have failed to collect all top secret documents. 
They have fallen into enemy hands and the public domain. 

You'll now have to answer to an inquiry and have created one massive scandal!
") 


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in pargraph:
		$RichTextLabel.text +=i
		await get_tree().create_timer(0.1).timeout 
	$AnimationPlayer.play("newspapaer")
	#await get_tree().create_timer(15).timeout 
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Handels button being pressed and returning to menu
func _on_button_pressed():
		get_tree().change_scene_to_file("res://menu_scene.tscn")
