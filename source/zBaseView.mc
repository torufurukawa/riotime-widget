using Toybox.WatchUi as Ui;


 class BaseView extends Ui.View {
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
