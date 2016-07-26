using Toybox.WatchUi as Ui;


class DrumView extends Ui.View {
	function initialize() {
		View.initialize();
	}
	
	 function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
     }
}


class DrumViewDelegate extends Ui.BehaviorDelegate {
	function initialize() {
		BehaviorDelegate.initialize();
	}
	
	 function onNextMode() {
	 	Logger.log("Next Mode");
	 }

	 function onNextPage() {
	 	Logger.log("Next Page");
	 }
}
