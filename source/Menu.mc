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
		if (item == :now) {
			Properties.set("referenceType", "now");
			return;
		}
		
		Ui.switchToView(new DrumView(), new DrumViewDelegate(), Ui.SLIDE_IMMEDIATE);
	}
}
