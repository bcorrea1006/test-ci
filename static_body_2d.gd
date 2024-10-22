extends StaticBody2D

# 2 refs ready on game start
@onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D
@onready var polygon_2d: Polygon2D = $CollisionPolygon2D/Polygon2D

# runs on launch
func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon
