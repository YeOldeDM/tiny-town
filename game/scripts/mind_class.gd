
extends Node

class Clock:
	var owner
	var timeout = 1.0
	var time = 0
	var timeout_call = ""

	func factory(own,length,result):
		self.owner = own
		self.timeout = length
		self.time = length
		self.timeout_call = result

	func _on_timeout():
		if self.owner.hasmethod(self.timeout_call):
			self.owner.call(self.timeout_call)
			self.owner.timers.remove(self)

	func tick(delta):
		if self.time <= 0:
			self._on_timeout()
		else:
			self.time -= delta


class Mind:
	var owner
	var current_activity = ""
	var activity_grid = {}
	
	var timers = []
	
	func add_timer(length,result):
		var clock = Clock.new()
		clock.factory(self,length,result)
		self.timers.append(clock)
	
	
	func tick(delta):
		if self.timers.size() > 0:
			for clk in self.timers:
				clk.tick(delta)


