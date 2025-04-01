extends Button

func _ready():
	# Only show this button in HTML5 builds
	if OS.get_name() == "Web":
		visible = true
		text = "Refresh Game"
		# In Godot 4, we use the built-in pressed signal
		# No need to manually connect it
	else:
		# Hide the button in non-web builds
		visible = true

# This function is automatically connected to the "pressed" signal
func _on_pressed():
	if OS.get_name() == "Web":
		# In Godot 4, JavaScript is accessed through the JavaScriptBridge singleton
		JavaScriptBridge.eval("""
			// Clear browser cache if possible
			if (window.caches) {
				caches.keys().then(function(names) {
					for (let name of names) caches.delete(name);
				});
			}
			
			// Force a hard reload
			window.location.reload(true);
		""")
