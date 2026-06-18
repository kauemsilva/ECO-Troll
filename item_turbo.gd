extends Area2D

func _ready():
    body_entered.connect(_on_body_entered)

func _on_body_entered(body):
    if body.name == "Jogador":
        Global.ativar_modo_turbo(5.0)
        queue_free()
