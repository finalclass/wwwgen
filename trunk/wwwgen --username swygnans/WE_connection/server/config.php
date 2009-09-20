<?php
$site = new Site('site');
return $site
	->add( new Menu('main_menu') )
		->add( new Button('aboutus') )->attr('label', 'O nas')
			->add(new Text('aboutus_text01') )->attr('content', 'Lorem ipsum here')->parent()
			->add( new Gallery('aboutus_gallery') )->attr('label', 'Galeria')
				->add(new Photo('aboutus_gallery_photo01'))->parent()
			->parent()
		->parent()
		->add( new Button('gallery') )->attr('label', 'Galeria')
			->add( new Gallery('gallery_gal'))
				->add(new Photo('gallery_gal_photo01'))->parent()
				->add(new Photo('gallery_gal_photo02'))->parent()
			->parent()
		->parent()
		->add(new Button('somethink'))->attr('label', 'Somethink')
			->add( new Text('somethink_text'))->attr('content', 'Abcccc')->parent()
		->parent()
	->parent();
	