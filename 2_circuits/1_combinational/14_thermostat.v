module top_module(
	input too_cold, 
	input too_hot,
	input mode,
	input fan_on,
	output heater,
	output aircon,
	output fan
);
	// Reminder: The order in which you write assign statements doesn't matter. 
	// assign statements describe circuits, so you get the same circuit in the end
	// regardless of which portion you describe first.

	// Fan should be on when either heater or aircon is on, and also when requested to do so (fan_on = 1).
	assign fan = heater | aircon | fan_on;
	
	// Heater is on when it's too cold and mode is "heating".
	assign heater = (mode & too_cold);
	
	// Aircon is on when it's too hot and mode is not "heating".
	assign aircon = (~mode & too_hot);
	
	// * Unlike real thermostats, there is no "off" mode here.
	
endmodule
