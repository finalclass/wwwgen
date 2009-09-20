package pl.zlasu 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author szymon@wygnanski.com
	 */
	public class ZEvent extends Event
	{
		
		static public const PANEL_CHANGED:String = 'panel changed';
		static public const ATTRIBUTE_CHANGED:String = 'attribute changed';
		static public const HTML_CHANGED:String = 'html changed';
		static public const CURRENT_ITEM_CHANGED:String = 'current item changed';
		
		public function ZEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}
	
}