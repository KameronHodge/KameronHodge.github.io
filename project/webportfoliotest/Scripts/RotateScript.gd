extends Node3D

@export var rotation_speed = .5

func _process(delta):
	rotate_y(rotation_speed * delta)
