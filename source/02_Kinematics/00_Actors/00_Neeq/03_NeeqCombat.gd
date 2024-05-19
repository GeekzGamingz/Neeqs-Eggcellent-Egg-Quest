#Inherits NeeqMovement Code
extends NeeqMovement
class_name NeeqCombat
#------------------------------------------------------------------------------#
#Variables
var last_action: String = ""
#Exported Variables
@export var combat_jump_multiplier: float = 1.0
@export_enum("Explorer", "Combat", "Sneeq", "Magic") var MODE: String
#OnReady Variables
@onready var quick_attack_timer: Timer = $Timers/QuickAttackTimer
@onready var strong_attack_timer: Timer = $Timers/StrongAttackTimer
@onready var combo_timer: Timer = $Timers/ComboTimer
#------------------------------------------------------------------------------#
#Handle Mode
func handle_mode() -> void:
	if (Input.get_action_strength("action_mode1") > 0 &&
		Input.get_action_strength("action_mode2") > 0): MODE = "Magic"
	elif Input.get_action_strength("action_mode1") > 0: MODE = "Combat"
	elif Input.get_action_strength("action_mode2") > 0: MODE = "Sneeq"
	elif (Input.get_action_strength("action_mode1") == 0 &&
		Input.get_action_strength("action_mode2") == 0): MODE = "Explorer"
#Update Last Action Pressed
func update_last_action():
	if combo_timer.is_stopped():
		if Input.is_action_just_pressed("action_quick"):
			last_action = "Quick"
			combo_timer.start()
		elif Input.is_action_just_pressed("action_interact"):
			last_action = "Interact"
			combo_timer.start()
		elif Input.is_action_just_pressed("action_travel"):
			last_action = "Travel"
			combo_timer.start()
		elif Input.is_action_just_pressed("action_cancel"):
			last_action = "Cancel"
			combo_timer.start()
		else: last_action = ""
