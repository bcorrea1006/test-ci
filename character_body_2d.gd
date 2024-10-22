extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0 # pos y goes down, -400 for up
const GRAVITY = 980


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor(): # only applies when you're NOT on the floor
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	# diff between left and right only 1 or -1
	var direction := Input.get_axis("ui_left", "ui_right") 
	if direction:
		velocity.x = direction * SPEED
	else:
		# move_toward moves our velocity to 0 with SPEED
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Causes you to slide along walls. Also updates your velocity
	move_and_slide()
