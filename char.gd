extends CharacterBody3D

const JUMP_VELOCITY = 5 #6.6 floaty
@export var movespeed = 5.0
@export var runmult = 2
@export var walkmult = 0.7
@export var crouchmult = 0.5
@export var deceleration = 0.5
@export var acceleration = 20
@export var rotaspeed = 15
@export var cooldown_active: bool = false
@export var cooldown_active2: bool = false
@export var can_jump: bool = true
@export var hurtable: bool = true
var currmove = 0
var lastmove := Vector3.BACK

@export var maxhealth = 8
@onready var health = maxhealth
@onready var invulntimer = $CDTimer4

@onready var cam_target = $cam_controller/cam_target
@onready var pitch = $cam_controller/cam_target/Pitch
@onready var camera3D = $cam_controller/cam_target/Pitch/SpringArm3D/Camera3D
@onready var skin = $charanim
@onready var animtree = $charanim/AnimationTree


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
	
	var changer = velocity.x 
	
	if velocity.length() > 0 and is_on_floor():
		animtree.set("parameters/state/transition_request", "walk")
	if Input.is_action_pressed("move_sprint") and is_on_floor():
		animtree.set("parameters/state/transition_request", "run")
	if velocity.length() == 0 and is_on_floor():
		animtree.set("parameters/state/transition_request", "idle")
	if Input.is_action_just_pressed("move_jump") and can_jump == true:
		animtree.set("parameters/jumper/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		can_jump = false
		if not is_on_floor():
			$CDTimer3.start()
	if Input.is_action_just_pressed("mb0") and cooldown_active == false and cooldown_active2 == false:
		animtree.set("parameters/shotattack/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		cooldown_active = true
		$CDTimer.start()
	if Input.is_action_just_pressed("mb0") and Input.is_action_pressed("move_crouch") and cooldown_active2 == false:
		animtree.set("parameters/attackheavy/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		cooldown_active2 = true
		$CDTimer2.start()
		#$Node/Skeleton3D/BoneAttachment3D/sabre/Area3D
	
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
		
	if event.is_action_pressed("key_j") and PlayerVar.health <=8:
		PlayerVar.health += 1
		
	if event.is_action_pressed("key_k") and PlayerVar.health >=1:
		PlayerVar.health -= 1
		
		

func _on_collect_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if hurtable == true:
		PlayerVar.health -= 1
		hurtable = false
		$CDTimer4.start()


func _on_cd_timer_timeout() -> void:
	cooldown_active = false
	pass # Replace with function body.


func _on_cd_timer_2_timeout() -> void:
	cooldown_active2 = false
	pass # Replace with function body.


func _on_cd_timer_3_timeout() -> void:
	can_jump = true
	pass # Replace with function body.


func _on_cd_timer_4_timeout() -> void:
	pass # Replace with function body.
	hurtable = true
