using Toybox.System;
using Toybox.Application;


module Properties {
	function set(key, value) {
		return Application.getApp().setProperty(key, value);
	}
	
	function get(key) {
		return Application.getApp().getProperty(key);
	}
}


module Logger {
	function log(value) {
		return System.println(value);
	}
}
