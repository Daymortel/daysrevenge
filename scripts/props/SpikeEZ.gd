extends Area2D

#Des pics pour tuer Kiyu mais en difficultÃ© normale.

func _on_SpikeEZ_body_entered(body):
	body.ouch(position.x) #Et le joueur meurt
