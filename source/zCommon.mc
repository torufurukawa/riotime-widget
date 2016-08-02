const RIO_OFFSET = -3 * 60 * 60;

function formatDate(moment) {
	var info = Time.Gregorian.info(moment, Time.FORMAT_MEDIUM);

   	// day of week in 3 letters
   	var dayOfWeek = info.day_of_week.substring(0, 3); 

	var text = Lang.format("$1$ $2$", [dayOfWeek, info.day]);
	return text;
}

function formatTime(moment) {
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
   	
   	// min
   	var min = info.min.toString();
   	if (info.min < 10) {
   		min = "0" + min;
   	}
   	
	var text = Lang.format("$1$$2$:$3$ $4$", [hour_pad, hour, min, mod]);
	return text;
}