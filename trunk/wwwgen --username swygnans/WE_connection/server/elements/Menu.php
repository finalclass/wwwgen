<?php

require_once 'Element.php';

class Menu extends Element {

	public $type = 'Menu';

	public function render() {
		$out = '<div id="menu"><ul>';
		foreach($this->children as $childId) {
			$child = Tree::find($childId);
			if($child instanceof Button) {
				$out .= $child->render();
			}
		}
		$out .= '</ul></div>';
		return $out;
	}
}
