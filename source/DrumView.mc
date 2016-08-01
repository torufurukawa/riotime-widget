using Toybox.WatchUi as Ui;


class DrumView extends BaseView {
	function initialize(location) {
		BaseView.initialize();
	}
	
	function onLayout(dc) {
        setLayout(Rez.Layouts.DrumLayout(dc));
    }
	
	function onUpdate(dc) {
		//var now = Time.now();
    	
    	//// local time
        //var localTimeLabel = View.findDrawableById("LocalTimeLabel");
        //localTimeLabel.setText("Local\n" + formatMoment(now));
        //
        //// Rio time
    	//var localOffset = System.getClockTime().timeZoneOffset;
    	//var rioOffset = RIO_OFFSET;
    	//var rioNow = now.add(new Time.Duration(rioOffset - localOffset));
        //var rioTimeLabel = View.findDrawableById("RioTimeLabel");
        //rioTimeLabel.setText("Rio\n" + formatMoment(rioNow));
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
	}
}


class DrumViewDelegate extends Ui.BehaviorDelegate {
	function initialize(location) {
		BehaviorDelegate.initialize();
	}
	
	function onNextPage() {
	 	Logger.log("Next Page");
	}
}
