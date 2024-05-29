extends Node2D



var Playroom = JavaScriptBridge.get_interface("Playroom")

# Keep a reference to the callback so it doesn't get garbage collected
var jsBridgeReferences = []
func bridgeToJS(cb):
	var jsCallback = JavaScriptBridge.create_callback(cb)
	jsBridgeReferences.append(jsCallback)
	return jsCallback
 
 
func _ready():
	JavaScriptBridge.eval("")
	var initOptions = JavaScriptBridge.create_object("Object");
 
	#Init Options
	initOptions.gameId = "2427"
 
	#Insert Coin
	Playroom.insertCoin(initOptions, bridgeToJS(onInsertCoin));
 
# Called when the host has started the game
func onInsertCoin(args):
	print("Coin Inserted!")
	Playroom.onPlayerJoin(bridgeToJS(onPlayerJoin))
 
# Called when a new player joins the game
func onPlayerJoin(args):
	var state = args[0]
	print("new player joined: ", state.id)
 
	# Listen to onQuit event
	state.onQuit(bridgeToJS(onPlayerQuit))
 
func onPlayerQuit(args):
	var state = args[0];
	print("player quit: ", state.id)
