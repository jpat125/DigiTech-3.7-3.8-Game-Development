extends CharacterBody3D
#var has_shovel = false

@export var inventory_data: InventoryData

signal toggle_inventory()


func _ready():
	set_meta("CharacterBody3D", 1)
	
	
func _process(delta):
	if BootlegGlobalVariable._bunker_camera == 1:
		$AnimationPlayer.play("bunker_cam")
		print (BootlegGlobalVariable._bunker_camera)
		print("bunk cam activated")
		await get_tree().create_timer(60).timeout
	else:
		print("cam animation not triggered")
	
const SPEED = 5
const JUMP_VELOCITY = 7
# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck: Node3D = $Neck
@onready var camera: Camera3D = $Neck/Camera3d
@onready var interact_ray: RayCast3D = $Neck/Camera3d/InteractRay


#func _unhandled_input(event: InputEvent) -> void:
#	if event is InputEventMouseButton:
#		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#	elif event.is_action_pressed("ui_cancel"):
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
#	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
#		if event is InputEventMouseMotion:
#			neck.rotate_y(-event.relative.x * 0.00)
#			camera.rotate_x(-event.relative.y * 0.00)
#			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(0), deg_to_rad(0))


	#adds physics and floor
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	#Legacy code that may need to be removed.
	if Input.is_action_just_pressed("inventory"):
		toggle_inventory.emit()
	if Input.is_action_just_pressed("interact"):
		print ("interacted w/ chest")
		interact()
	
	
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	
		
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# finds key pressed then plays relevant animation for movement direction.
	if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			if Input.is_action_just_pressed("left"):
				$soldier/AnimationPlayer.play("left_walk")
				$walking.play() #sfx
				$idle_breathing.stop() #sfx
			elif Input.is_action_just_pressed("forward"):
				$soldier/AnimationPlayer.play("backwards_walk")
				$walking.play() #sfx
				$idle_breathing.stop() #sfx
			elif Input.is_action_just_pressed("right"):
				$soldier/AnimationPlayer.play("right_walk")
				$walking.play() #sfx
				$idle_breathing.stop() #sfx
			elif Input.is_action_just_pressed("back"):
				$soldier/AnimationPlayer.play("forward_walk")
				$walking.play() #sfx
				$idle_breathing.stop() #sfx
			
			elif Input.is_action_just_pressed("destroy"):
					BootlegGlobalVariable._contact_wall == 1 and BootlegGlobalVariable._shovel_status == 1
					
					$soldier/AnimationPlayer.play("singlehand_pickaxe")
			else:
				print("else event triggered")
				#$soldier/AnimationPlayer.play("idle")
				#$walking.stop() #sfx
				#$idle_breathing.play() #sfx

			#$soldier/AnimationPlayer.play("forward_walk")
	#elif direction: 
	#		velocity.x = move_toward(velocity.x, 0, SPEED)
	#		velocity.z = move_toward(velocity.z, 0, SPEED)
	#		$walking.stop() #sfx
	#		if Input.is_action_just_pressed("destroy"):
	#			BootlegGlobalVariable._contact_wall == 1 and BootlegGlobalVariable._shovel_status == 1
	#			$soldier/AnimationPlayer.play("singlehand_pickaxe")
	#		else:
	#			print()
					
					
	else:
			#idle movements and sounds
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			$soldier/AnimationPlayer.play("idle")
			$walking.stop() #sfx
			$idle_breathing.play() #sfx

	move_and_slide()





# code for interact ray.
func interact()-> void:
	print("Hey")
	if interact_ray.is_colliding():
		interact_ray.get_collider().player_interact
		print ("collider")
		
