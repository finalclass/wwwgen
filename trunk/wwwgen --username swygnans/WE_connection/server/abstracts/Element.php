<?php

class Lib_Element {
	
	private $_attributes = array();
	private $_parent = null;
	private $_children = array();
	private $_id = null;
	private $_lastChild = null;
	private $_pointer = null;
	private $_depth = 0;
	private $_isContainer = false;

	static private $_link = array();
	static private $_indexes = array();

	final public function __construct($id) {
		$this->setId($id);
		self::$_indexes[$id] = $this;
		$this->init();
	}

	public function init() {}

	public function getDepth() {
		if($this->_depth == null) {
			$this->_depth = $this->parent() ? $this->parent()->getDepth() + 1 : 0;
		}
		return $this->_depth;
	}
	/**
	 *
	 * @param <type> $element
	 * @return <type>
	 */
	public function add($element) {
		if( !($element instanceof Lib_Element) ) {
			throw new Lib_Exception('Próba Dodania obiektu: ' . get_class($element), Lib_Exception::HTTP_FORBIDDEN);
		}
		$element->parent($this);
		$this->_children[] = $element;
		$this->_lastChild = $element;
		return $element;
	}

	public function lastChild() {
		return $this->_lastChild;
	}

	public function populate($data) {
		$type = $data['type'];
		$elements = isset($data['elements']) ? $data['elements'] : array();
		
		if( isset($data['argv']) && is_array($data['argv'])) {
			foreach($data['argv'] as $name=>$value) {
				$this->attr($name, $value);
			}
		}

		foreach($elements as $elementLink => $elementData) {
			$elemName = 'U_' . $elementData['type'];
			$element = new $elemName($elementLink);
			$element->populate($elementData);
			$this->add($element);
		}
		return $this;
	}

	public function children() {
		return $this->_children;
	}

	public function getIndexes() {
		return self::$_indexes;
	}

	public function dump($maxDepth = null) {
		static $depth = 0;
		if($depth == 0) {
			echo '<pre class="dump">';
		}
		Zend_Debug::dump(get_class($this) . ' #' . $this->getId());
		Zend_Debug::dump($this->_attributes);
		$depth++;
		foreach($this->children() as $child) {
			$child->dump();
		}
		$depth--;
		if($depth == 0) {
			echo '</pre>';
		}
	}

	public function parent(&$parent = null) {
		if($parent == null) {
			return $this->_parent;
		}
		$this->_parent = $parent;
	}

	public function setParentById($id) {
		$this->setParent(self::$_indexes[$id]);
	}

	public function attr($name, $value = null) {
		if($value == null) {
			return isset($this->_attributes[$name]) ? $this->_attributes[$name] : null;
		}
		$this->_attributes[$name] = $value;
		return $this;
	}

	public function attrs($array = null) {
		if($array !== null) {
			array_merge($this->_attributes, $array);
		}
		return $this->_attributes;
	}

	/**
	 *
	 * @param string $link
	 * @return instance of Lib_Element lub fałsz w przypadku niepowodzenia
	 */
	public function get($link = null) {
		if($link != null) {
			if(isset(self::$_indexes[$link]) ) {
				return self::$_indexes[$link];
			} else {
				$className = get_class($this);
				return $this->add(new $className($link));

			}
		}
		return $this->_elements[$this->_pointer];
	}

	public function isContainer() {
		return $this->_isContainer;
	}

	public function setIsContainer($flag) {
		$this->_isContainer = $flag;
		return $this;
	}

	public function getForGuid($guid) {
		
	}

	public function prev() {
		$this->_pointer--;
		return $this;
	}

	public function next() {
		$this->_pointer++;
		return $this;
	}

	public function current() {
		return $this->_elements[$this->_pointer];
	}

	static public function setLink($link) {
		self::$_link = $link;
	}

	static public function getLink() {
		return self::$_link;
	}

	/**
	 * Należy nadpisać
	 */
	public function render() {}
	
	public function __toString() {
		return $this->render();
	}

	public function setId($id) {
		$this->_id = $id;
	}

	public function getId() {
		return $this->_id;
	}
}

