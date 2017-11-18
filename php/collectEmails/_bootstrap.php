<?php

require 'vendor/autoload.php';

$db = \ParagonIE\EasyDB\Factory::create(
    'mysql:host=localhost;dbname=fotostrana_test',
    'root',
    ''
);