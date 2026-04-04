extends CharacterBody2D

const JUMP_HEIGHT: float = -400.0
const MAX_SPEED: float = 300.0
const ACCELERATION: float = 18.5
const FRICTION: float = 22.5
const GRAVITY_WALL: float = 8.5
const GRAVITY_NORMAL: float = 14.5
const WALL_JUMP_PUSH_FORCE: float = 100.0
const WALL_CONTACT_COYOTE_TIME: float = 0.2
const WALL_JUMP_LOCK_TIME: float = 0.05

var wall_contact_coyote: float = 0.0
var wall_jump_lock: float = 0.0
var look_dir_x: int = 1

@onready var _animation: Node2D = $Animation



func _physics_process(delta: float) -> void:
	var x_input: float = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var velocity_weight_x: float = 1.0 - exp(-(ACCELERATION if x_input else FRICTION) * delta)
	
	if wall_jump_lock > 0.0:
		wall_jump_lock -= delta
		velocity.x = lerp(velocity.x, x_input * MAX_SPEED, velocity_weight_x * 0.5)
	else:
		velocity.x = lerp(velocity.x, x_input * MAX_SPEED, velocity_weight_x)

	if x_input != 0:
		_animation.scale.x = sign(x_input)
		
	if is_on_floor() or wall_contact_coyote > 0.0:
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_HEIGHT
			if wall_contact_coyote > 0.0:
				velocity.x = -look_dir_x * WALL_JUMP_PUSH_FORCE
				wall_jump_lock = WALL_JUMP_LOCK_TIME
	
	if !is_on_floor() and velocity.y > 0 and is_on_wall() and velocity.x != 0:
		look_dir_x = sign(velocity.x)
		wall_contact_coyote = WALL_CONTACT_COYOTE_TIME
		velocity.y = GRAVITY_WALL
	else:
		wall_contact_coyote -= delta
		velocity.y += GRAVITY_NORMAL
	
	move_and_slide()
