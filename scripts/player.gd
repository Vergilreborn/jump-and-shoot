extends KinematicBody2D

var speedX = 200;
var speedY = 200;

var velocity = Vector2();

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
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1;
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1;
	
	velocity = velocity.normalized();
	velocity.x = velocity.x * speedX;
	velocity.y = velocity.y * speedY;
	
	
func _physics_process(delta):
	get_input();
	velocity = move_and_slide(velocity)
