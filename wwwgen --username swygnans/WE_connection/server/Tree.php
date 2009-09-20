<?php 

require_once 'Element.php';

class Tree {

	static public $elements = array();

	/**
	* Pobiera z rejestru obiekt o id $id
	* 
	* @param $id string
	* @throws TreeException
	*/
	static public function find($id) {
		if( ! Tree::exists($id) ) {
			require_once 'TreeException.php';
			throw new TreeException('Nie ma obiektu ' . $id . 'o podanym $id w drzewie');
		}
		return self::_getElement($id);
	}
	
	/**
	* Ustawia w rejestrze element $obj
	* 
	* @param $obj Element
	* @param $parent mixed Element || string(id)
	* @return Element - dodany element
	*/
	static public function add(Element $obj, $parent) {
		$parent = self::_getElement($parent);
		$parent->children[] = $obj;
		self::$elements[$obj->id] = $obj;
		return $obj;
	}
	
	/**
	* Zwraca element w postaci obiektu typu Element
	* 
	* @param $element mixed: Element || string(id)
	* @return Element
	* @throws TreeException
	*/
	static private function _getElement($element) {		
		if($element instanceof Element) {
			return $element;
		}
		if( is_string($element) ) {
			return self::$elements[$element];
		} else {
			require_once 'TreeException.php';
			throw new TreeException('Nie można pobrać obiektu. Niezgodny typ. Możliwe typu to Element oraz String');
		}
	}
	
	/**
	* Sprawdza czy podany element istnieje w drzewie
	* 
	* @param $element mixed: Element || string(id)
	* @return bool
	*/
	static public function exists($element) {
		$element = self::_getElement($element);
		return isset(self::$elements[$element->id]);
	}
	
	/**
	* Usuwa z rejestru element
	* 
	* @param $element mixed: string (id) || Element
	*/
	static public function remove($element) {
		$element = Tree::find($elementId);
		$parent = Tree::find($element->parentId);
		$id = array_search($element->id, $parent->children);
		unset($parent->children[$id]);
		unset(self::$elements);
		unset($element);
	}
	
	/**
	* Zwraca tablice takiej postaci:
	* $idElementu => $element
	* 
	* @return array 
	*/
	static public function getAllElements() {
		return self::$elements;
	}
	
	/**
	* ustawia nowy rejestr
	* $idElementu => $element
	* 
	* @param $assoc array
	*/ 
	static public function setAllElements($assoc) {
		self::$elements = $assoc;
	}
	
	/**
	* Zmienia id dla podanego elementu;
	* 
	* @param $element mixed: Element || String(id - stare id)
	* @param $newId string
	* return $element Element
	*/
	static public function changeId($element, $newId) {
		$element = self::_getElement($element);
		$element->id = $newId;
	}
	
	/**
	* Generuje id
	* 
	* @param example mixed
	*/ 
	static public function generateId($example = null) {
		if( $example === null) {
			do {
				$example = substr( md5($example & time()), 0, 8);
			} while( Tree::exists($example) );
		}
	}
	
}