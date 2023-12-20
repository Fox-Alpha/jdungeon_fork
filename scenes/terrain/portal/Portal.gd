extends Node2D

class_name Portal

@export var destination_server: String = ""
@export var destination_portal: String = ""
@export var destination_name: String = ""

@onready var portal_area: Area2D = $PortalArea2D
@onready var portal_location: Marker2D = $PortalLocation
@onready var destination_label: Label = $DestinationLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	if G.is_server():
		portal_area.body_entered.connect(_on_body_entered)
	else:
		destination_label.text = destination_name
		#var _c1 = portal_area.mouse_entered.connect(_on_mouse_entered)
		#var _c2 = portal_area.mouse_exited.connect(_on_mouse_exited)

		#GodotLogger.info(
			#"Mouse signal connected States {}/{} {}/{}".format(
				#[_c1, portal_area.mouse_entered.is_connected(_on_mouse_entered),
				#_c2, portal_area.mouse_exited.is_connected(_on_mouse_exited)], "{}"))

func _on_mouse_entered() -> void:
	if not G.is_server():
		GodotLogger.info(
			"MouseEntereded Portal Area {0} ({1})".format(
				[name, destination_name]
			))
	destination_label.visible = true
	pass


func _on_mouse_exited() -> void:
	if not G.is_server():
		GodotLogger.info(
			"MouseExited Portal Area {0} ({1})".format(
				[name, destination_name]
			))
	destination_label.visible = false
	pass


func _on_body_entered(body: Node2D):
	if body.get("entity_type") == null:
		return

	if body.entity_type != J.ENTITY_TYPE.PLAYER:
		return

	GodotLogger.info("Player=[%s] entered portal=[%s]" % [body.name, name])
	S.server_rpc.enter_portal.rpc_id(1, body.username, destination_server, destination_portal)


func get_portal_location() -> Vector2:
	return position + portal_location.position


func _on_portal_area_2d_mouse_entered() -> void:
	if not G.is_server():
		GodotLogger.info(
			"MouseEntereded Portal Area {0} ({1})".format(
				[name, destination_name]
			))
	destination_label.visible = true


func _on_portal_area_2d_mouse_exited() -> void:
	if not G.is_server():
		GodotLogger.info(
			"MouseExited Portal Area {0} ({1})".format(
				[name, destination_name]
			))
	destination_label.visible = false
	pass




func _on_portal_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	GodotLogger.info(
			"_on_portal_area_2d_mouse_shape_entered Portal Area {0} ({1})".format(
				[name, destination_name]
			))


func _on_portal_area_2d_mouse_shape_exited(shape_idx: int) -> void:
	GodotLogger.info(
			"_on_portal_area_2d_mouse_shape_exited Portal Area {0} ({1})".format(
				[name, destination_name]
			))
