extends Node2D

func _ready():
	refresh_char()
	match Global.current_world:
		1:
			$Kiyu.position = Vector2(309.543, 346.053)
			$HUD/Bar/CurrentWorld.text = "WORLDMAP_BIGTITLE"
		2:
			$Kiyu.position = Vector2(991.543, 922.053)
			$HUD/Bar/CurrentWorld.text = "WORLDMAP_BIGTITLE2"

func _on_Level_body_exited(body):
	$HUD/Bar/LevelName.hide()
	$AntiBug.start()

func _on_Level1_body_entered(body):
	match Global.current_world:
		1:
			Global.current_level = 1 #Change le niveau actuel vers le niveau 1-1
		2:
			Global.current_level = 5 #Change le niveau actuel vers le niveau 2-1

func _on_Level2_body_entered(body):
	match Global.current_world:
		1:
			Global.current_level = 2 #Change le niveau actuel vers le niveau 1-2
		2:
			Global.current_level = 6 #Change le niveau actuel vers le niveau 2-2

func _on_Level3_body_entered(body):
	match Global.current_world:
		1:
			Global.current_level = 3 #Change le niveau actuel vers le niveau 1-3
		2:
			Global.current_level = 7 #Change le niveau actuel vers le niveau 2-3

func _on_Level4_body_entered(body):
	match Global.current_world:
		1:
			Global.current_level = 4 #Change le niveau actuel vers le niveau 1-4
		2:
			Global.current_level = 8 #Change le niveau actuel vers le niveau 2-4

func _on_AntiBug_timeout():
	Global.current_level = 0

func _on_World1_body_entered(body):
	Global.current_world = 1
	$HUD/Bar/CurrentWorld.text = "WORLDMAP_BIGTITLE"

func _on_World2_body_entered(body):
	Global.current_world = 2
	$HUD/Bar/CurrentWorld.text = "WORLDMAP_BIGTITLE2"

func open_menu():
	if not $Kiyu.select:
		$HUD/AnimationPlayer.play("scroll_up")
		$Kiyu.select = true
	else:
		$HUD/AnimationPlayer.play("scroll_down")
		$Kiyu.select = false

func _on_Kiyu_next_char():
	Global.character += 1
	refresh_char()

func _on_Kiyu_prev_char():
	Global.character -= 1
	refresh_char()

func refresh_char():
	$HUD/CharSelect/AnimatedSprite.play(str(Global.character))
	if Global.character > 2:
		Global.character -= 1
	elif Global.character < 1:
		Global.character += 1
