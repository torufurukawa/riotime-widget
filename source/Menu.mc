using Toybox.Application as Application;
using Toybox.WatchUi as Ui;
using Toybox.System;


class Menu extends Ui.Menu {
	function initialize() {
		Ui.Menu.initialize();
		self.setTitle("Set time to");
		self.addItem("Now", :now);
		self.addItem("Local", :now);
		self.addItem("Rio", :now);
	}
}

class MenuDelegate extends Ui.MenuInputDelegate {
	function initialize() {
		Ui.MenuInputDelegate.initialize();
	}

	function onMenuItem(item) {
		if (item == :now) {
			Properties.set("referenceType", "now");
		}
		return true;
	}
}
