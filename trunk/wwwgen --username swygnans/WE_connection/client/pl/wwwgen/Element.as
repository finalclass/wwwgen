package pl.wwwgen
{
	import pl.wwwgen.dtos.*;
	
	public class Element implements IElement
	{
		private var _id:String = '';
		private var _children:Array = [];
		private var _parentId:String = '';
		
		public function Element(obj:Object)
		{
			id = obj.id;
		}
		
		public function get children() : Array {
			return _children;
		}
		
		public function set children(childArr:Array) : void {
			_children = childArr;
		}
		
		public function get id() : String {
			return _id;
		}
		
		public function set id(newId:String) : void {
			_id = newId;
		}
		
		public function get parentId() : String {
			return _parentId;
		}
		
		public function set parentId(newId:String) : void {
			_parentId = newId;
		}

		static public function populate(obj:Object) : Element {
			var element:Element;
			for(var i:String in obj) {
				
				switch(obj.type) {
					case 'Button':
						element = new ButtonDO(obj);  
					break;
					case 'Gallery':
						element = new GalleryDO(obj);
					break;
					case 'Menu':
						element = new MenuDO(obj);
					break;
					case 'Photo':
						element = new PhotoDO(obj);
					break;
					case 'Site':
						element = new SiteDO(obj);
					break;
					case 'Text':
						element = new TextDO(obj);
					break;
					default:
						//@TODO: throw exception
					break;
				}
			}
			return element;
		}
	}
}