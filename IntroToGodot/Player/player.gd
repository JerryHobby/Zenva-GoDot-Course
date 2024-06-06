extends CharacterBody2D

var speed = 500;
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= 1 * speed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += 1 * speed
	if Input.is_key_pressed(KEY_UP):
		velocity.y -= 1 * speed
	if Input.is_key_pressed(KEY_DOWN):
		velocity.y += 1 * speed

	move_and_slide()

	

