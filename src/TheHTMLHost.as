package
{	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.Event;
	import flash.geom.*;
	import flash.html.*;
	import flash.utils.flash_proxy;

	public class TheHTMLHost extends HTMLHost implements IEventDispatcher
	{
		public var eventDispatcher:EventDispatcher;
		
		public var theTitle:String = "no title";
		public var theUrl:String = "";
		
		public function TheHTMLHost(defaultBehaviors:Boolean=true)
		{
			super(defaultBehaviors);
			eventDispatcher = new EventDispatcher(this);
		}
		
		override public function windowClose():void
		{
			trace("windowClose");
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.WINDOWCLOSE_EVENT));
		}
		
		override public function createWindow(windowCreateOptions:HTMLWindowCreateOptions):HTMLLoader
		{
			trace("createWindow: " + windowCreateOptions);
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.CREATEWINDOW_EVENT));

			var htmlLoader:HTMLLoader = new HTMLLoader();
			return htmlLoader;
		}
		
		override public function updateLocation(locationURL:String):void
		{
			trace("updateLocation: " + locationURL);
			theUrl = locationURL;
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.UPDATELOCATION_EVENT));
		}       
		
		override public function set windowRect(value:Rectangle):void
		{
			trace("windowRect: " + value);
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.SETWINDOWRECT_EVENT));
		}
		
		override public function updateStatus(status:String):void
		{
			trace("updateStatus: " + status);
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.UPDATESTATUS_EVENT));
		} 
		
		override public function updateTitle(title:String):void
		{
			trace("updateTitle: " + title);
			theTitle = title;
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.UPDATETITLE_EVENT));
		}
		
		override public function windowBlur():void
		{
			trace("windowBlur");
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.WINDOWBLUR_EVENT));
		}
		
		override public function windowFocus():void
		{
			trace("windowFocus");
			dispatchEvent(new HTMLHostEvent(HTMLHostEvent.WINDOWFOCUS_EVENT));
		}
		
		// IEventDispatcher Methods
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void{
			eventDispatcher.addEventListener(type, listener, useCapture, priority);
		}
		
		public function dispatchEvent(evt:Event):Boolean {
			return eventDispatcher.dispatchEvent(evt);
		}
		
		public function hasEventListener(type:String):Boolean {
			return eventDispatcher.hasEventListener(type);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function willTrigger(type:String):Boolean {
			return eventDispatcher.willTrigger(type);
		}		
	}
}