extends Node2D

onready var room = $GenericRoom
onready var key := $GenericRoom/Objects/Key
onready var player = $GenericRoom/ControllablePlayer

func _ready():
	if not GameState.key_on_floor(GameState.STATE.KEY_B_3_POS_A):
		key.visible = false
	room.connect("object_clicked", self, "_on_object_clicked")

func _on_object_clicked(node):
	match node.name:
		"Key":
			room.player_walk_to(key.position)
			GameState.interaction_is_frozen = true
			yield(player, "position_reached")
			key.visible = false
			GameState.set_state(GameState.STATE.KEY_B_3_POS_A, true)
			GameState.interaction_is_frozen = false
			FlashText.flash("You pick up a red key.")
			SoundModule.play_sfx("ItemPickedUp")