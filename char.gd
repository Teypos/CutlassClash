extends CharacterBody3D

@export var health = 8
const JUMP_VELOCITY = 6.6
@export var movespeed = 5.0
@export var runmult = 2
@export var walkmult = 0.7
@export var crouchmult = 0.5
@export var deceleration = 0.5
@export var acceleration = 20
@export var rotaspeed = 10
var currmove = 0
var lastmove := Vector3.BACK

@onready var cam_target = $cam_controller/cam_target
@onready var pitch = $cam_controller/cam_target/Pitch
@onready var camera3D = $cam_controller/cam_target/Pitch/SpringArm3D/Camera3D
@onready var skin = $charanim


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_pressed("move_sprint") and is_on_floor():
		currmove = movespeed * runmult
	if not Input.is_action_pressed("move_sprint") and is_on_floor():
		currmove = movespeed
	if Input.is_action_pressed("move_walk") and is_on_floor():
		currmove = movespeed * walkmult
	if Input.is_action_just_released("move_walk"):
		currmove = movespeed
	if Input.is_action_pressed("move_crouch") and is_on_floor():
		currmove = movespeed * crouchmult
	if Input.is_action_just_released("move_crouch"):
		currmove = movespeed
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (cam_target.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	#var direction = cam_target.global_basis.z * input_dir.y + cam_target.global_basis.x * input_dir.x    #usa a direção do target da camera como orientação do movimento
	#direction.y = 0
	#direction = direction.normalized()
	
	if direction:
		velocity.x = direction.x * currmove
		velocity.z = direction.z * currmove
	else:
		velocity.x = move_toward(velocity.x, 0.0, deceleration)
		velocity.z = move_toward(velocity.z, 0.0, deceleration)
		
		#velocity = velocity.move_toward(direction * currmove, acceleration * delta)

	move_and_slide()
	
	if direction.length() > 0.2:
		lastmove = direction
	var target_angle = Vector3.BACK.signed_angle_to(lastmove, Vector3.UP)
	#skin.global_rotation.y = target_angle
	skin.global_rotation.y = lerp_angle(skin.rotation.y, target_angle, rotaspeed * delta)
	
	#var ground_speed := velocity.length()
	#if ground_speed > 0.0:
		#skin.move()
	#else:
		#skin.idle()
	
	
	#$MeshInstance3D.rotation.y = lerp($MeshInstance3D.rotation.y, $cam_controller/cam_target.rotation.y, 0.06)

	#cam handle
	var camera_position = $cam_controller.position
	camera_position.x = lerp(camera_position.x, position.x, 0.1)
	camera_position.z = lerp(camera_position.z, position.z, 0.1)
	camera_position.y = lerp(camera_position.y, position.y, 0.05)
	$cam_controller.position = camera_position
	
	#$MeshInstance3D.rotation.y = lerp_angle( $MeshInstance3D.rotation.y, direction.y, 0.1) 
	#$MeshInstance3D.rotation.y = lerp_angle( $MeshInstance3D.rotation.y, direction, 0.1) 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mb0"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	if event.is_action_pressed("ui_text_backspace"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
