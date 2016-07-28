using Toybox.WatchUi as Ui;


class DrumView extends BaseView {
	function initialize() {
		BaseView.initialize();
	}
}


class DrumViewDelegate extends Ui.BehaviorDelegate {
	function initialize() {
		BehaviorDelegate.initialize();
	}
	
	function onNextPage() {
	 	Logger.log("Next Page");
	}
}
