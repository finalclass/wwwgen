package pl.zlasu 
{
	import mx.controls.Tree;
	import mx.events.ListEvent;
	import pl.zlasu.utils.Index;
	import pl.zlasu.browser.Browser;
	import pl.zlasu.utils.Broadcaster;
	
	/**
	 * ...
	 * @author szymon@wygnanski.com
	 */
	public class Structure extends Tree
	{
		
		private var _dataXML:XML;
		
		public function Structure() 
		{
			super();
			
			x = 0;
			y = 50;
			width = 200;
			percentHeight = 100;
			
			dataXML = Index.find('site').getXML();
			labelField = '@label';
			
			addEventListener(ListEvent.CHANGE, onChange);
			Broadcaster.addListener(ZEvent.CURRENT_ITEM_CHANGED, onCurrentItemChange);
		}
		
		public function onChange(event:ListEvent) : void {
			Browser.getInstance().currentId = selectedItem.@id;
		}
		
		public function set dataXML(newData:XML) : void {
			_dataXML = newData;
			dataProvider = _dataXML;
		}
		
		public function get dataXML() : XML { 
			return _dataXML;
		}
		
		public function onCurrentItemChange(event:ZEvent) : void {
			var container:XML = <node/>;
			container.appendChild(_dataXML);
			var results:XMLList = container..node.(@id == Browser.getInstance().currentId);
			if ( ! results[0] ) {
				return;
			}
			var item:Item = Index.find(results[0].@id);
			if ( ! item ) {
				return;
			}
			
			selectedItem = results[0];
			
			//var parent:Item = Index.find(item.parent);
			results = container..node.(@id == item.parent);
			if ( results[0] ) {
				expandItem(results[0], true);
			}
			
			//var found:XML = container..node.(@id == Browser.getInstance().currentId)[0];
			
		}
		
	}
	
}