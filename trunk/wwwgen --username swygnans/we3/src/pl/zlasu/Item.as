package pl.zlasu {

	import mx.containers.Canvas;
	import mx.controls.Button;
	import mx.controls.Label;
	import pl.zlasu.utils.Index;
	import pl.zlasu.panels.base.PanelBase;
	
	public class Item implements IItem {

		private var _id:String;
		private var _children:Array = new Array();
		public var parent:String;
		public var skin:String = 'standard';
		public var name:String = 'New element';

		public function Item(newId:String) : void {
			id = newId;
			name = id;
		}
		
		public function get id() : String {
			return _id;
		}
		
		public function set id(newId:String) : void {
			if ( Index.has(_id) ) {
				Index.del(_id);
			}
			_id = newId;
			Index.add(this);
		}
		
		public function addChild(child:Item) : Item {
			if ( ! _children ) {
				_children = new Array();
			}
			child.parent = this.id;
			_children.push(child.id);
			Index.add(child);
			return child;
		}
		
		public function removeChild(childId:String) : void {
			_children.splice( _children.indexOf(childId), 1);
		}
		
		public function get children() : Array {
			return _children;
		}
		
		public function render() : String {
			var childrenOutput:String = new String();
			for (var i:String in children) {
				childrenOutput += Index.find(children[i]).render();
			}
			var _this:Item = this;
			return SkinManager[skin]
				.replace(/<as>(.*?)<\/as>/gim, function() : String { return _this[arguments[1]] } )
				.replace(/<children\/>/gim, childrenOutput);
		}
		
		public function getPanel() : PanelBase {
			return new PanelBase();
		}
		
		public function getXML() : XML {
			var output:XML = <node label={name} id={id} ></node>;
			
			for (var i:String in children) {
				output.appendChild(Index.find(children[i]).getXML());
			}
			
			return output;
		}
		
	}
	
}