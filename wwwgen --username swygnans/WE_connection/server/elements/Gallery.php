<?php

require_once 'Element.php';

class Gallery extends Element {

	public $type = 'Gallery';

	public function render() {
		$out = '<div class="gallery">';
		foreach($this->children as $childId) {
			$child = Tree::find($childId);
			if($child instanceof Photo) {
				$out .= $child->renderAsThumb();
			}
		}
		
		return $out . '</div>';
	}
}
