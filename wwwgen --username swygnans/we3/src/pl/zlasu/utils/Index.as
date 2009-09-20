package pl.zlasu.utils {
	import flash.events.DataEvent;
	import flash.utils.Proxy;
	import mx.collections.errors.ItemPendingError;
	import pl.zlasu.elements.*;
	import pl.zlasu.Item;
	import flash.utils.flash_proxy;
	import com.gsolo.encryption.MD5;
	
	public class Index {
		
		static private var _items:Object = new Object();
		
		static public function find(id:String) : Item {
			if ( Index._items[id] === undefined ) {
				Index._items[id] = new Item(Index.generateUniqueId());
			}
			return Index._items[id];
		}
		
		static public function has(id:String) : Boolean {
			return Index._items[id] !== undefined;
		}
		
		static public function add(item:Item) : Item {
			Index._items[item.id] = item;
			return item;
		}
		
		static public function del(id:String) : void {
			delete Index._items[id];
		}

		static public function generateUniqueId() : String {
			var id:String = new String();
			var d:Date = new Date();
			
			do {
				id = MD5.encrypt( (Math.random() * d.time).toString() );
			} while ( Index.has(id) );			
			return id;
		}
		
	}
	
}