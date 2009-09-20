package pl.zlasu.elements {
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.containers.Canvas;
	import mx.containers.HBox;
	import mx.controls.Button;
	import mx.controls.Label;
	import mx.controls.TextInput;
	import pl.zlasu.Item;
	import pl.zlasu.elements.ZText;
	import pl.zlasu.utils.Index;
	import pl.zlasu.ZEvent;
	
	import mx.binding.utils.BindingUtils;
	
	import pl.zlasu.utils.Broadcaster;
	import pl.zlasu.panels.base.PanelBase;
	import pl.zlasu.panels.ZSitePanel;
	import pl.zlasu.SkinManager;
	
	[Bindable]
	public class ZSite extends Item {
		
		public var title:String = 'WWWEditor 3';
		public var url:String = 'http://localhost';
		public var backgroundColor:String = '#888888';
		
		private var _panel:ZSitePanel;
		
		public function ZSite(newId:String) : void {
			super(newId);
			skin = 'ZSite';
		}
		
		override public function getPanel() : PanelBase {
			if ( ! _panel ) {
				_panel = new ZSitePanel();
				_panel.parentItem = this;
			}
			return _panel;
		}
		
		public function onChange(event:MouseEvent) : void {
			Broadcaster.broadcast(new ZEvent(ZEvent.ATTRIBUTE_CHANGED));
		}
	}
	
}