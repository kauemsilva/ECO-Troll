extends Node

var vidas_maximas: int = 15
var vidas_atuais: int = vidas_maximas
var indestrutivel: bool = false

func _ready():
    print("Gerenciador Global Iniciado com ", vidas_atuais, " vidas.")

func perder_vida():
    if indestrutivel:
        return
    vidas_atuais -= 1
    if vidas_atuais <= 0:
        game_over()
    else:
        get_tree().reload_current_scene()

func curar_vida():
    if vidas_atuais < vidas_maximas:
        vidas_atuais += 1

func ativar_modo_turbo(duracao: float):
    indestrutivel = true
    await get_tree().create_timer(duracao).timeout
    indestrutivel = false

func game_over():
    print("Mensagem de Derrota: Game Over!")
    vidas_atuais = vidas_maximas
    # Substitua futuramente por uma cena de Game Over real
    get_tree().change_scene_to_file("res://fase_1.tscn")
