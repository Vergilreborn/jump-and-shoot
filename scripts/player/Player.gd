extends KinematicBody2D

var playerVelocity = Vector2.ZERO;

func player_run():
	if Input.is_action_pressed("right"):
		playerVelocity.x = 100;
	
	if Input.is_action_pressed("left"):
		playerVelocity.x = -100;

#Updates per frame for physics
func _physics_process(delta):
	player_run();
	move_and_slide(playerVelocity);
	
	#Rather than a hard stop we can use the weight to slow the player down
	#when they are on ice (3rd parameter weight in decimal as percentage)
	playerVelocity.x = lerp(playerVelocity.x, 0, 0.5);

