extends Button

func _ready():
	# Only show this button in Web builds
	if OS.get_name() == "Web":
		visible = true
		text = "Refresh Game"
	else:
		# Hide the button in non-web builds
		visible = false

# This function is automatically connected to the Button's "pressed" signal
func _pressed():
	if OS.get_name() == "Web":
		# Use JavaScriptBridge.eval to execute JavaScript code in Godot 4
		JavaScriptBridge.eval("""
			// Try to clear cache using Cache API if available
			if (window.caches) {
				caches.keys().then(function(cacheNames) {
					cacheNames.forEach(function(cacheName) {
						caches.delete(cacheName);
						console.log('Cache deleted:', cacheName);
					});
				});
			}
			
			// Force a complete reload, bypassing the cache
			window.location.reload(true);
		""")
