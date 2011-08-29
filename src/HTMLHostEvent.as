package
{
	import flash.events.Event;
	
	public class HTMLHostEvent extends Event
	{		
		public static const WINDOWCLOSE_EVENT:String = "WINDOWCLOSE"; 
		public static const CREATEWINDOW_EVENT:String = "CREATEWINDOW"; 
		public static const UPDATELOCATION_EVENT:String = "UPDATELOCATION";
		public static const SETWINDOWRECT_EVENT:String = "SETWINDOWRECT";
		public static const UPDATESTATUS_EVENT:String = "UPDATESTATUS";
		public static const UPDATETITLE_EVENT:String = "UPDATETITLE";
		public static const WINDOWBLUR_EVENT:String = "WINDOWBLUR";
		public static const WINDOWFOCUS_EVENT:String = "WINDOWFOCUS";

		public function HTMLHostEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}