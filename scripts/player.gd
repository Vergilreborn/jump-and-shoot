extends KinematicBody2D

var speedX = 200;
var speedY = 500;

var velocity = Vector2();
var jumpVelocity = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
func get_input():
	velocity = Vector2.ZERO;
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1;
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 1;
	
	velocity = velocity.normalized();
	velocity.x = velocity.x * speedX;
	
	
func jumping():
	if(jumpVelocity > 0):
		velocity.y -= jumpVelocity;
		jumpVelocity -= 25;
	else:
		velocity.y +=speedY;
	
func is_jumping():
	if(jumpVelocity <= 0):
		if(Input.is_action_pressed("ui_up")):
			jumpVelocity = speedY
	
	
	
func _physics_process(delta):
	get_input();
	jumping();
	is_jumping()
	move_and_slide(velocity, Vector2(0,1));
	
	
