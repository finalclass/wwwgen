<?php

/**
 * Atrtibutes
 * label
 */
require_once 'Element.php';

class Button extends Element {

	public $label = '';
	public $type = 'Button';

	public function render() {
		return '<li class="home">
					<a class=" home" href="' . $this->id . '">
						<span>
							' . $this->label . '
						</span>
					</a>
				</li>';
	}
}
