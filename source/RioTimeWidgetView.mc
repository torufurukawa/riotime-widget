using Toybox.WatchUi as Ui;
using Toybox.Time as Time;
using Toybox.System as System;


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
    	// determin local offset
    	var localOffset = new Time.Duration(System.getClockTime().timeZoneOffset);
    	// format
    	var localNow = now;  //.add(localOffset);
    	var info = Time.Gregorian.info(localNow, Time.FORMAT_MEDIUM);
    	// todo: AM/PM
    	// todo: better format of hour
		var text = Lang.format("$1$ $2$ $3$:$4$", [info.day_of_week, info.day, info.hour, info.min]);
    	// update text
        var localTimeLabel = View.findDrawableById("LocalTimeLabel");
        localTimeLabel.setText(text);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    //! Called when this View is removed from the screen. Save the
    //! state of this View here. This includes freeing resources from
    //! memory.
    function onHide() {
    }

}
