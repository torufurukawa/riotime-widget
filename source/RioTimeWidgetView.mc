using Toybox.WatchUi as Ui;
using Toybox.Time as Time;
using Toybox.System as System;


const RIO_OFFSET = -3 * 60 * 60;


class RioTimeWidgetView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    //! Load your resources here
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

    //! Called when this View is brought to the foreground. Restore
    //! the state of this View and prepare it to be shown. This includes
    //! loading resources into memory.
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
    	var now = Time.now();
    	
    	// local time
        var localTimeLabel = View.findDrawableById("LocalTimeLabel");
        localTimeLabel.setText("Local\n" + formatMoment(now));
        
        // Rio time
    	var localOffset = System.getClockTime().timeZoneOffset;
    	var rioOffset = RIO_OFFSET;
    	var rioNow = now.add(new Time.Duration(rioOffset - localOffset));
        var rioTimeLabel = View.findDrawableById("RioTimeLabel");
        rioTimeLabel.setText("Rio\n" + formatMoment(rioNow));
    	

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }
    
    function formatMoment(moment) {
    	var info = Time.Gregorian.info(moment, Time.FORMAT_MEDIUM);

    	// AM/PM
    	var mod = "AM";
    	if (12 <= info.hour) {
    		mod = "PM";
    	}
    	// hour
    	var hour = info.hour;
    	if (12 <= hour) {
    		hour = hour - 12;
    	}
    	var hour_pad = "";
    	if (hour < 10) {
    		hour_pad = " ";
    	}
    	
    	// day of week in 3 letters
    	var dayOfWeek = info.day_of_week.substring(0, 3); 

		var text = Lang.format("$1$ $2$ $6$$3$:$4$ $5$", [dayOfWeek, info.day, hour, info.min, mod, hour_pad]);
		return text;
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }
}


class RioTimeWidgetViewDelegate extends Ui.BehaviorDelegate {
	function onSelect() {
		System.println("### SELECT");
	}
}
