extends Node
class_name Resistance

# Defines a resistance - an object can posess multiple 
# resistances.  This is the object template for any specific
# resistance.

@export var title:String = "Resistance"

@export var type:Damage.DamageType
@export var absolute:float 
@export var percent:float 
@export var duration:float 
@export var health:float 

