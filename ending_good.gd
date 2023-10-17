extends Control


var pargraph = ("[center][b]Mission Successfull![/b]

You have succeeded in collecting all top secret documents, preventing them falling into enemy or public hands.

For your actions you have been promoted to the rank of Warrent Officer. 

Well done!") 


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in pargraph:
		$RichTextLabel.text +=i
		await get_tree().create_timer(0.1).timeout 
	#await get_tree().create_timer(5).timeout 
	$AnimationPlayer.play("promotion")
	
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
