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
		self.renderTime();
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
	
	function renderTime() {
		// get reference time
		var moment = self.refMoment;
		Logger.log(moment.value());
		// add timezone difference if rio time
		if (self.location == :rio) {
			var localOffset = System.getClockTime().timeZoneOffset; 
			moment = moment.add(new Time.Duration(RIO_OFFSET - localOffset));
		}
		Logger.log(moment.value());
		// format time
		var text = formatDate(moment) + "\n" + formatTime(moment);
		// set text
		var label = View.findDrawableById("TimeLabel");
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
