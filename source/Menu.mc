using Toybox.Application as Application;
using Toybox.WatchUi as Ui;
using Toybox.System;


class Menu extends Ui.Menu {
	function initialize() {
		Ui.Menu.initialize();
		self.addItem("Now", :now);
		self.addItem("Local", :local);
		self.addItem("Rio", :rio);
	}
}


class MenuDelegate extends Ui.MenuInputDelegate {
	function initialize() {
		Ui.MenuInputDelegate.initialize();
	}

	function onMenuItem(item) {
		// if "now" is selected, save it and return immediately
		if (item == :now) {
			Properties.set("referenceType", "now");
			return;
		}
		
		// else, transit to drum view
		Ui.switchToView(new DrumView(item), new DrumViewDelegate(item), Ui.SLIDE_IMMEDIATE);
	}
}
