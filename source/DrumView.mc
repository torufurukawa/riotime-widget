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
		Logger.log("reference time in UTC: " + moment.value().toString());
		// add timezone difference if rio time
		if (self.location == :rio) {
			var localOffset = System.getClockTime().timeZoneOffset; 
			moment = moment.add(new Time.Duration(RIO_OFFSET - localOffset));
		}
		Logger.log("reference time in zone: " + moment.value().toString());
		// format time
		var text = formatDate(moment) + "\n" + formatTime(moment);
		// set text
		var label = View.findDrawableById("TimeLabel");
        label.setText(text);
	}
	
	function incrHour() {
		self.refMoment = self.refMoment.add(new Time.Duration(3600));
		Logger.log("updated reference time: " + self.refMoment.value().toString());
	}

	function decrHour() {
		self.refMoment = self.refMoment.add(new Time.Duration(-3600));
		Logger.log("updated reference time: " + self.refMoment.value().toString());
	}
	
	function save() {
		Properties.set("referenceType", "specific");
		Properties.set("referenceTime", self.refMoment.value());
	}
}


class DrumViewDelegate extends Ui.BehaviorDelegate {
	var view;
	
	function initialize(view) {
		BehaviorDelegate.initialize();
		self.view = view;
	}
	
	function onNextPage() {
	 	Logger.log("detected: next page");
	 	self.view.incrHour();
	 	Ui.requestUpdate();
	}

	function onPreviousPage() {
	 	Logger.log("detected: prev page");
	 	self.view.decrHour();
	 	Ui.requestUpdate();
	}
	
	function onSelect() {
		Logger.log("detected: select");
		self.view.save();
		Ui.popView(SLIDE_IMMEDIATE);		
		Ui.requestUpdate();
	}
}
