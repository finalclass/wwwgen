<?php
return array (
  'wwwgen' => array (
    'type' => 'Site',
    'argv' => array ('title' => 'Tytuł strony' ),
    'elements' => array (
      'main_menu' => array (
        'type' => 'Menu',
        'elements' => array (
          'wwwgen_aboutus' => array (
            'type' => 'Button',
            'argv' => array ('label' => 'LOREM WOREM!'),
            'elements' => array (
              'wwwgen_aboutus_begining' => array (
                'type' => 'Text',
                'argv' => array ('title' => 'Strona pierwsza','content' => 'Jakiś content Lorem worem Coś tam'),
                'elements' => array (
                ),
			   ),
			  'wwwgen_aboutus_begining2' => array (
                'type' => 'Text',
                'argv' => array ('url' => 'css/Site.css', 'title' => '2222222', 'maxLength' => 1000),
                'elements' => array (
                ),
              ),
			  'wwwgen_aboutus_gallery' => array(
				'type' => 'Gallery',
				'elements' => array(
					'wwwgen_aboutus_gallery_photo01' => array('type' => 'Photo'),
					'wwwgen_aboutus_gallery_photo02' => array('type' => 'Photo'),
				)
			  ),
			  'wwwgen_aboutus_begining002' => array (
                'type' => 'Text',
                'argv' => array ('title' => 'Strona pierwsza','content' => 'Jakiś content Lorem worem Coś tam'),
                'elements' => array (
                ),
			   ),
			  'wwwgen_aboutus_begining0023' => array (
                'type' => 'Text',
                'argv' => array ('url' => 'css/Site.css', 'title' => '2222222', 'maxLength' => 1000),
                'elements' => array (
                ),
              ),
			  'wwwgen_aboutus_gallery00023' => array(
				'type' => 'Gallery',
				'elements' => array(
					'wwwgen_aboutus_gallery_photo01' => array('type' => 'Photo'),
					'wwwgen_aboutus_gallery_photo02' => array('type' => 'Photo'),
				)
			  ),

            ),

          ),
		  'wwwgen_aboutus10' =>
          array (
            'type' => 'Button',
            'argv' =>
            array (
              'label' => 'Przycisk',
            ),
            'elements' =>
            array (
              'wwwgen_aboutus10_begining3' =>
              array (
                'type' => 'Text',
                'argv' =>
                array (
                  'title' => 'Strona pierwsza',
                  'content' => 'Jakiś content',
                ),
                'elements' =>
                array (
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ),
);