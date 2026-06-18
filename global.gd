extends Node

var vidas_maximas: int = 15
var vidas_atuais: int = vidas_maximas
var indestrutivel: bool = false

func perder_vida():
    if indestrutivel:
        return
    vidas_atuais -= 1
    if vidas_atuais <= 0:
        game_over()
    else:
        get_tree().reload_current_scene()

func ativar_modo_turbo(duracao: float):
    indestrutivel = true
    await get_tree().create_timer(duracao).timeout
    indestrutivel = false

func game_over():
    vidas_atuais = vidas_maximas
    get_tree().change_scene_to_file("res://fase_1.tscn")

func avancar_fase(proxima_fase: String):
    get_tree().change_scene_to_file(proxima_fase)
