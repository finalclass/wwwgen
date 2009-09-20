<?php

abstract class Element {

	public $parentId = '';
	public $children = array();
	public $id = '';
	
	private $_depth = 0;

	static private $_indexes = array();

	final public function __construct($id = null) {
		$this->id = Tree::generateId($id);
		$this->init();
	}
	
	public function init() {}
	
	
	public function rec(&$assoc = array()) {
		$c = array();
		foreach($this->children as $child) {
			array_push($c, $child->id);
			$child->rec($assoc);
		}
		unset($this->children);
		$this->children = $c;
		
		unset($this->inAddress);
		unset($this->_lastChild);
		unset($this->_pointer);
		unset($this->_isContainer);
		$assoc[$this->id] = $this;
		return $assoc;
	}
	
	/**
	* Pobiera poziom zagnieżdżenia tego elementu
	*/
	public function depth() {
		if($this->_depth == null) {
			$this->_depth = $this->parent() ? $this->parent()->getDepth() + 1 : 0;
		}
		return $this->_depth;
	}
	
	public function addChild($element) {
		$this->children[] = $element->id;
		Tree::add($element, $this);
		return $element;
	}

	/**
	 * Gdy podamy argument to ustawia zmienną parentId
	 * Gdy nie podamy zwraca obiekt rodzica
	 * 
	 * @param $parentId:String = null
	 */
	public function parent($parentId = null) {
		if($parentId == null) {
			return self::$_indexes[$this->parentId];
		}
		$this->parentId = $parentId;
	}

	
	abstract public function render();
	
	public function __toString() {
		return $this->render();
	}

	public function setId($id) {
		Tree::changeId($this, $id);
	}

	public function getId() {
		return $this->id;
	}
}

