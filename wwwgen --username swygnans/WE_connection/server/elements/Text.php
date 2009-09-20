<?php

/**
 * Attributes:
 * title
 * url
 * content
 * maxLength
 * stripTags
 * 
 * 
 */

require_once 'Element.php';

class Text extends Element {

	public $type = 'Text';
	public $title = '';
	public $url = '';
	public $content = '';
	public $maxLength = 20;
	public $stripTags = true;

	public function render() {
		return '<h3>' . $this->title . '</h3>' 
			. $this->getContent($this->stripTags, $this->maxLength);
	}

	public function getContent($stripTags = false, $length = null) {
		//Dopisać sprawdzanie czy plik istnieje
		if( '' !== $this->url ) {
			$this->content = file_get_contents($this->url);
		}
		$out = $this->content;
		if($stripTags) {
			$out = strip_tags($out);
		}
		if($length !== null) {
			$out = substr($out, 0, $length);
		}
		
		return $out;
	}
}