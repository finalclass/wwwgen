package pl.zlasu.elements {
	
	import pl.zlasu.Item;
	import pl.zlasu.panels.ZTextPanel;
	import pl.zlasu.panels.base.PanelBase;
	import mx.binding.utils.BindingUtils;
	import pl.zlasu.SkinManager;
	
	[Bindable] 
	public class ZText extends Item {

		public var text:String = 'empty text';
		
		private var _panel:ZTextPanel;
		
		public function ZText(newId:String) : void {
			super(newId);
			skin = 'ZText';
		}
		
		override public function getPanel() : PanelBase {
			if ( ! _panel ) {
				_panel = new ZTextPanel();
				_panel.parentItem = this;
			}
			return _panel;
		}
		
	}
	
}