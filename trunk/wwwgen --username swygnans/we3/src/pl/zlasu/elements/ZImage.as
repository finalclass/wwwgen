package pl.zlasu.elements {
	
	import pl.zlasu.Item;
	import pl.zlasu.panels.base.PanelBase;
	import pl.zlasu.SkinManager;
	import pl.zlasu.utils.Index;
	import pl.zlasu.panels.ZImagePanel;
	import pl.zlasu.Config;
	
	[Bindable] 
	public class ZImage extends Item {
		
		public var imageUrl:String;
		public var width:int = 100;
		public var height:int = 100;
		
		private var _panel:ZImagePanel;
		
		public function ZImage(newId:String) : void {
			super(newId);
			imageUrl = (Index.find('site') as ZSite).url + Config.IMAGES_FOLDER + '/' + id + '.jpg';
			skin = 'ZImage';
		}
		
		override public function getPanel() : PanelBase {
			if ( ! _panel ) {
				_panel = new ZImagePanel();
				_panel.parentItem = this;
			}
			return _panel;
		}
		
	}
	
}