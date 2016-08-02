using Toybox.Application;
using Toybox.WatchUi as Ui;
using Toybox.Time as Time;
using Toybox.System as System;


class RioTimeWidgetView extends Ui.View {

    function initialize() {
        View.initialize();
    }
    
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
    	var refType = Properties.get("referenceType");
    	Logger.log("reference type: " + refType);

    	var now = Time.now();
		if (refType.equals("specific")) {
			var value = Properties.get("referenceTime");
			Logger.log("reference time: " + value.toString());
			now = new Time.Moment(value);
		}
		Logger.log("time: " + now.value().toString());
    	
    	// local time
        var localTimeLabel = View.findDrawableById("LocalTimeLabel");
        localTimeLabel.setText("Local\n" + formatDate(now) + " " + formatTime(now));
        
        // Rio time
    	var localOffset = System.getClockTime().timeZoneOffset;
    	var rioOffset = RIO_OFFSET;
    	var rioNow = now.add(new Time.Duration(rioOffset - localOffset));
        var rioTimeLabel = View.findDrawableById("RioTimeLabel");
        rioTimeLabel.setText("Rio\n" + formatDate(rioNow) + " " + formatTime(rioNow));
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }
}


class RioTimeWidgetViewDelegate extends Ui.BehaviorDelegate {
	function initialize() {
		Ui.BehaviorDelegate.initialize();
	}

	function onSelect() {
		Ui.pushView(new Menu(), new MenuDelegate(), Ui.SLIDE_IMMEDIATE);
		return true;
	}
}
