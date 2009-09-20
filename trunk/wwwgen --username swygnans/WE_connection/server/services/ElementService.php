<?php

class ElementService {

	static private function init() {
	
	}

	static public function getAll() {
		require_once 'Element.php';
		require_once 'elements/Button.php';
		require_once 'elements/Gallery.php';
		require_once 'elements/Menu.php';
		require_once 'elements/Photo.php';
		require_once 'elements/Site.php';
		require_once 'elements/Text.php';
		require_once 'Exception.php';
		
		return unserialize( file_get_contents('temp/serialized3.ini') );
	}

	static public function save($elements) {
		require_once 'Element.php';
		require_once 'elements/Button.php';
		require_once 'elements/Gallery.php';
		require_once 'elements/Menu.php';
		require_once 'elements/Photo.php';
		require_once 'elements/Site.php';
		require_once 'elements/Text.php';
		require_once 'Exception.php';
		
		Tree::setAllElements(ElementService.getAll());
		file_put_contents('temp/serialized5.ini', serialize(Tree::$elements) );
	}
	
}