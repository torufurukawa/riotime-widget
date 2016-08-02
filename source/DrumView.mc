using Toybox.WatchUi as Ui;
using Toybox.Time as Time;



class DrumView extends Ui.View {
	var location;
	var refMoment;

	function initialize(location) {
		View.initialize();

		self.location = location;

		// reference time
		var now = Time.now().value();
		var roundedTime = now - (now % 3600); 
		self.refMoment = new Time.Moment(roundedTime);
	}
	
	function onLayout(dc) {
        setLayout(Rez.Layouts.DrumLayout(dc));
    }
	
	function onUpdate(dc) {
		self.renderLocation();
		
		// render date time
		
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
	
	function renderLocation() {
		var text = "";
		if (self.location == :local) {
			text = "Local";
		} else if (self.location == :rio) {
			text = "Rio";
		}
		var label = View.findDrawableById("LocationLabel");
        label.setText(text);
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
