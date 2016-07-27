using Toybox.WatchUi as Ui;


class DrumView extends Ui.View {
	function initialize() {
		View.initialize();
	}
	
	 function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        
        var screenHeight = dc.getHeight();
        var headerHeight = 20;
        var rowHeight = (screenHeight - 20) / 2;
        
        var localTimeLabel = View.findDrawableById("LocalTimeLabel");
        localTimeLabel.locY = headerHeight;
        
        var rioTimeLabel = View.findDrawableById("RioTimeLabel");
        rioTimeLabel.locY = headerHeight + rowHeight;
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
