package pl.zlasu.browser {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.containers.Canvas;
	import mx.controls.Button;
	import mx.controls.HTML;
	import pl.zlasu.Panel;
	import pl.zlasu.ZEvent;
	
	import pl.zlasu.utils.Index;
	import pl.zlasu.panels.base.PanelBase;
	import pl.zlasu.utils.Broadcaster;

	public class Browser {
		
		static private var _instance:Browser;
		
		private var _currentElement:Object;
		private var _currentId:String;
		
		private var _html:HTML;
		
		public function Browser(enforcer:SinglettonEnforcer) : void {
		}
		
		static public function getInstance() : Browser {
			if( ! Browser._instance ) {
				Browser._instance = new Browser( new SinglettonEnforcer() );
			}
			return Browser._instance;
		}
		
		public function set html(hypertext:HTML) : void {
			_html = hypertext;
			_html.percentWidth = 100;
			_html.percentHeight = 100;
			_html.x = 210;
			_html.y = 50;
			_html.opaqueBackground = 0xe0e0e0;
			_html.addEventListener(Event.COMPLETE, onComplete);
		}
		
		public function get html() : HTML {
			return _html;
		}
		
		public function onComplete(event:Event) : void {
			initListeners();
		}
		
		public function initListeners() : void {
			var nodes:Object = html.domWindow.document.getElementsByName('item');
			for (var i:int = 0; i < nodes.length; i++) {
				nodes[i].addEventListener('click', onClick);
			}
		}
		
		public function set currentId(newId:String) : void {
			if ( _currentElement ) {
				_currentElement.setAttribute('class', _currentElement.getAttribute('class').replace(/currentElement/, ''));
			}
			_currentElement = html.domWindow.document.getElementById(newId);
			
			_currentElement.setAttribute('class', _currentElement.getAttribute('class') + ' currentElement');
			
			_currentId = _currentElement.getAttribute('id');

			var c:PanelBase = Index.find(_currentId).getPanel();

			Panel.getInstance().currentPanel = c;
			Broadcaster.broadcast(new ZEvent(ZEvent.CURRENT_ITEM_CHANGED));
		}
		
		public function get currentId() : String {
			return _currentId;
		}
		
		
		public function onClick(event:*) : void {
			var clicked:Object = event.target;
			if ( clicked.getAttribute('name') != 'item' ) {
				return;
			}
			currentId = clicked.getAttribute('id');
		}
		
		public function set htmlText (value:String) : void {
			html = new HTML();
			_html.htmlText = value;
			Broadcaster.broadcast(new ZEvent(ZEvent.HTML_CHANGED));
		}
		
	}
}
class SinglettonEnforcer {
}