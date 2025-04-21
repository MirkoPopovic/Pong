extends ColorRect

var score := [0,0]
const PADDLE_SPEED : int = 500


func _on_ball_timer_timeout() -> void:
	$Ball.new_ball()


func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$Hud/CPUScore.text = str(score[1])
	var ball_position = body.get_position()
	var explosion = preload("res://explodion.tscn").instantiate()
	explosion.global_position = ball_position
	add_child(explosion)
	$BallTimer.start()

func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$Hud/CPUScore.text = str(score[0])
	var ball_position = body.get_position()
	var explosion = preload("res://explodion.tscn").instantiate()
	explosion.global_position = ball_position
	add_child(explosion)
	$BallTimer.start()
