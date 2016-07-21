using Toybox.System;
using Toybox.Application;

module Utils {
	function log(value) {
		return System.println(value);
	}
	
	function setProperty(key, value) {
		return Application.getApp().setProperty(key, value);
	}
	
	function getProperty(key) {
		return Application.getApp().getProperty(key);
	}
}
