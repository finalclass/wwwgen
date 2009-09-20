package pl.zlasu.utils {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	
	public class Broadcaster {
		
		private static var _dispatcher:EventDispatcher = new EventDispatcher();
		
		/**
		 * This is static function, you cannot instantiate this!
		 */
		public function Broadcaster(self:Broadcaster) : void {
			if( self != this ) {
				throw new Error('This class is static, dont instantiate it');
			}
		}
		
		static public function addListener(type:String, listener:Function, useCapture:Boolean = false,
			priority:int = 0, useWeakReference:Boolean = false) : void {
			
			Broadcaster._dispatcher.addEventListener(type, listener, useCapture,
				priority, useWeakReference);
		}
		
		static public function broadcast(event:Event) : void {
			Broadcaster._dispatcher.dispatchEvent(event);
		}
		
	}
	
}