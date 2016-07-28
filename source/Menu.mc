using Toybox.Application as Application;
using Toybox.WatchUi as Ui;
using Toybox.System;


class Menu extends Ui.Menu {
	function initialize() {
		Ui.Menu.initialize();
		self.setTitle("Set time to");
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
		var refType;
		if (item == :now) {
			refType = "now";	
		} else if (item == :local) {
			refType = "local";
		} else {
			refType = "rio";
		}
		Properties.set("referenceType", refType);
		
		// if "now" is selected, save it and return immediately
		if (item == :now) {
			return;
		}
		
		// else, transit to drum view
		Ui.switchToView(new DrumView(), new DrumViewDelegate(), Ui.SLIDE_IMMEDIATE);
	}
}
