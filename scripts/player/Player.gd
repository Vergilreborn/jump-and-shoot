extends KinematicBody2D

#CONSTANTS
const SPEED = 150;
const GRAVITY = 25;
const JUMP_FORCE = -500;
const FRICTION = 1;

#Variables being manipulated
var playerVelocity = Vector2.ZERO;

func get_input():
	if Input.is_action_pressed("right"):
		playerVelocity.x = SPEED;
		$Sprite.play("run")
		$Sprite.flip_h = false;
	elif Input.is_action_pressed("left"):
		playerVelocity.x = -SPEED;
		$Sprite.play("run")
		$Sprite.flip_h = true;
	else:
		$Sprite.play("idle")
	if !is_on_floor():
		$Sprite.play("air")
		
	if Input.is_action_just_pressed("jump") && is_on_floor():
		playerVelocity.y = JUMP_FORCE;

func apply_gravity():
	playerVelocity.y += GRAVITY;
	

#Updates per frame for physics
func _physics_process(delta):
	get_input();
	apply_gravity()
	playerVelocity = move_and_slide(playerVelocity, Vector2.UP);
	
	#Rather than a hard stop we can use the weight to slow the player down
	#when they are on ice (3rd parameter weight in decimal as percentage)
	playerVelocity.x = lerp(playerVelocity.x, 0, FRICTION);

