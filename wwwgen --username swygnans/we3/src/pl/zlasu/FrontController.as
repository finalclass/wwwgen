package pl.zlasu {
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import mx.containers.Canvas;
	import mx.controls.HTML;
	import mx.core.UIComponent;
	import pl.zlasu.elements.ZImage;
	import pl.zlasu.elements.ZText;
	
	import pl.zlasu.elements.ZSite;
	import pl.zlasu.browser.Browser;
	import pl.zlasu.utils.Index;
	import pl.zlasu.Panel;
	import pl.zlasu.utils.Broadcaster;
	
	public class FrontController extends Canvas {

		public var site:ZSite;
		public var html:HTML;
		
		public var panel:Canvas;

		public function FrontController() : void {
			percentWidth = 100;
			percentHeight = 100;
			panel 	= new Canvas();;
			site 	= new ZSite('site');
			html 	= Browser.getInstance().html;
			
			site.addChild(new ZText('main_text01'));
			site.addChild(new ZText('main_text02'));
			site.addChild(new ZImage('main_image01'));
			Index.add(site);
			
			Panel.getInstance().currentPanel.addEventListener(Event.CHANGE, onChange);
			Broadcaster.addListener(ZEvent.PANEL_CHANGED, onPanelChange);
			Broadcaster.addListener(ZEvent.ATTRIBUTE_CHANGED, onChange);
			Broadcaster.addListener(ZEvent.HTML_CHANGED, onHtmlChange);
			
			Browser.getInstance().htmlText = site.render();
			addChild(panel);
			
			addChild(new Structure());
		}
		
		public function onHtmlChange(event:ZEvent) : void {
			if ( Browser.getInstance().html && !contains(Browser.getInstance().html))
				addChild(Browser.getInstance().html);
		}
		
		public function onPanelChange(event:ZEvent) : void {
			panel.removeAllChildren();
			panel.addChild(Panel.getInstance().currentPanel);
		}
		
		public function onChange(event:Event) : void {
			Browser.getInstance().htmlText = site.render();
		}
		
	}
	
}