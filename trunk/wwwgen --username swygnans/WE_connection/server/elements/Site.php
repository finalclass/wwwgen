<?php

/**
 * Attributes
 * title
 * inAddress
 */

require_once 'Element.php';
class Site extends Element {

	static private $_link = array();
	
	static public function setLink($link) {
		self::$_link = $link;
	}

	static public function getLink() {
		return self::$_link;
	}
	
	public $type = 'Site';
	public $title = '';
	public $inAddress = '';

	public function render404() {
		die('<h1>404</h1>');
	}

	public function render() {
		$out = '
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>' . $this->title . '</title>
	<link rel="stylesheet" type="text/css" href="/css/Site.css" />
	<link rel="stylesheet" type="text/css" href="/css/Element.css" />
</head>
<body>
<div class="leftbg"></div>

<div class="rightbg"></div>
<div id="head"><div class="head-left">
	<div class="logo"><a href="/">USite</a></div>

		<div class="searchbox"><div class="sb-right"><div class="sb-left">
		<form id="searchform" action="" method="get">
			<div class="label">Szukaj</div>
			<div class="search"><input type="text" name="s" id="s" value="" /></div>
			<div class="search-but"><input type="submit" id="searchsubmit" value=" " /></div>
		</form>
	</div></div></div>
		' . Tree::find('main_menu')->render() . '
</div></div>

<div id="content"><div class="cont-border-white"><div class="cont-border-grey">
	<div id="main">
		<div class="content">
			<div class="entry">
				<h2>' . Tree::find(self::getLink())->label . '</h2>';
				foreach(Tree::find(self::getLink())->children as $childId) {
					if($childId == null) {
						continue;
					}
					$out .= Tree::find($childId)->render();
				}
				
				$out .= '
			</div>
		</div>
	</div>

	<div id="sidebars">

		<div id="sidebar-left">
			<ul>
				<li class="categories">
					<h2>Categories</h2>
					<ul>
						<li class="cat-item cat-item-1">
							<a href="">Uncategorized</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div id="sidebar-right">
			<ul>
				<li>
					<h2>Recent Posts</h2>
					<ul>
						<li>
							<span class="date2">[28.9.2007]</span><br />
							<a href="" >Hello world!</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>

	<div class="clear"></div>

</div></div></div>

<div id="footer"><div class="foot">
	<div class="copy">
		<div class="l textleft">wygnanski.com &reg;</div>
		<div class="valid">Valid <a href="http://jigsaw.w3.org/css-validator/validator?uri=http://wordpress.freelayouts.com/wp-content/themes/5297/style.css">CSS</a> &amp; <a href="http://validator.w3.org/check?uri=referer">XHTML</a></div>

		<div class="clear"></div>
	</div>

</div></div>
</body>
</html>
';

		return $out;
	}

}