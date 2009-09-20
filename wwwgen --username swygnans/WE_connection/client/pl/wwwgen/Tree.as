package pl.wwwgen
{
	import pl.wwwgen.dtos.SiteDO;
	
	public class Tree
	{
		
		static public var elements:Object = new Object;
		
		/**
		* Pobiera z rejestru obiekt o id $id
		* 
		* @param $id string
		* @throws TreeException
		*/
		static public function find(id:String) : IElement {
			if( ! Tree.exists(id) ) {
				//throw new TreeException('Nie ma obiektu ' + id + 'o podanym $id w drzewie');
			}
			var elem:IElement = Tree.elements[id];
			return Tree.elements[id];
		}
		
		/**
		* Ustawia w rejestrze element $obj
		* 
		* @param $obj Element
		* @param $parent mixed Element || string(id)
		* @return Element - dodany element
		*/
		static public function add(obj:Element, parentId:String) : Element {
			var parent:IElement = find(parentId);
			parent.children.push(obj);
			Tree.elements[obj.id] = obj;
			return obj;
		}
		
		/**
		* Sprawdza czy podany element istnieje w drzewie
		* 
		* @param $element mixed: Element || string(id)
		* @return bool
		*/
		static public function exists(elementId:String) : Boolean{
			return Tree.elements[elementId] != undefined;
		}
		
		/**
		* Usuwa z rejestru element
		* 
		* @param $element mixed: string (id) || Element
		*/
		static public function remove(elementId:String) : void {
			var obj:IElement = find(elementId);
//			element = find(element);
			var parent:IElement = find(obj.parentId);
			var id:int = parent.children.indexOf(obj.id);
			
			parent.children[id] = null;
			Tree.elements[id] = null;
			delete parent.children[id];
			delete Tree.elements[id];
		}
		
		/**
		* Zmienia id dla podanego elementu;
		* 
		* @param $element mixed: Element || String(id - stare id)
		* @param $newId string
		* return $element Element
		*/
		static public function changeId(element:Element, newId:String) : Element{
			Tree.elements[newId] = element;
			Tree.elements[element.id] = null;
			delete Tree.elements[element.id];
			element.id = newId;
			return element;
		}
		
		/**
		* Generuje id
		* 
		* @param example mixed
		*/ 
		static public function generateId(example:String = null) : String {
			return 'aa';
		}

	}
}