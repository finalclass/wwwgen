<?php

require_once 'Element.php';

class Photo extends Element {

	public $type = 'Photo';

	public $alt = '';

	public function render() {
		$out =
			'<a href="' . $this->getId() . '">
				<img src="images/' . $this->getId() . '.jpg" alt="' . $this->alt . '"/>'
			.'</a>';
		return $out;
	}
	
	public function renderAsThumb() {
		$out =
			'<a href="' . $this->getId() . '">
				<img src="images/' . $this->getId() . '_thumb.jpg" alt="' . $this->alt . '"/>'
			.'</a>';
		return $out;
	}

	public function renderAsContent() {
		$out =
			'<a href="' . $this->getId() . '">
				<img src="images/' . $this->getId() . '.jpg" alt="' . $this->alt . '"/>'
			.'</a>';
	}

	public function getThumb() {
		
	}

	public function getBigImage() {
		
	}
}