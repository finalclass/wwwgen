<?php
$time = microtime(true);
require_once 'Element.php';
require_once 'elements/Button.php';
require_once 'elements/Gallery.php';
require_once 'elements/Menu.php';
require_once 'elements/Photo.php';
require_once 'elements/Site.php';
require_once 'elements/Text.php';
require_once 'Exception.php';
require_once 'Tree.php';

Site::setLink(isset($_GET['link']) ? $_GET['link'] : 'aboutus');

try {
	
	if(0) {
		$site = require_once('config.php');
		file_put_contents('temp/serialized2.ini', serialize(Element::getIndexes()) );
	}
	
	Tree::setAllElements(unserialize( file_get_contents('temp/serialized3.ini')));
	$site = Tree::find('site');
	
	if(0) {
		require_once 'services/ElementService.php';
		echo '<pre>';
		var_dump(ElementService::getAll());
		echo '</pre>';
		exit;
	}
	if(0) {
		echo '<pre>';
		$assoc = array();
		
		$site->rec($assoc);
		Tree::setAllElements($assoc);
		var_dump(Tree::getAllElements());
		exit;
		file_put_contents('temp/serialized3.ini', serialize(Tree::getAllElements()) );
		
	}
	require_once 'services/ElementService.php';
	
	echo Tree::find('site')->render();
} catch( Lib_Exception $e) {
	echo '
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<center>
		<h1>Lib_Exception</h1>
		<h2>Message: ' . $e->getMessage() . '</h2>
		<h1 style="color:red">Line: ' . $e->getLine() . '</h2>
		<h3>Code: ' . $e->getCode() . '</h3>
	</center>
	<h1>Trace</h1>
	<pre style="color:blue;text-align:left;">';
	var_dump($e->getTrace());
	echo '</pre>';
} catch(TreeException $e) {
	 echo '
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<center>
		<h1>TreeException</h1>
		<h2>Message: ' . $e->getMessage() . '</h2>
		<h1 style="color:red">Line: ' . $e->getLine() . '</h2>
		<h3>Code: ' . $e->getCode() . '</h3>
	</center>
	<h1>Trace</h1>
	<pre style="color:blue;text-align:left;">';
	var_dump($e->getTrace());
	echo '</pre>';
}

echo microtime(true) - $time . ' sekundy';