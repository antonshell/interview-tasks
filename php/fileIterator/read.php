<?php

require 'vendor/autoload.php';

spl_autoload_register('autoLoader');

function autoLoader($className)
{
    $file = str_replace('\\',DIRECTORY_SEPARATOR,$className);
    require_once __DIR__ . DIRECTORY_SEPARATOR . $file . '.php';
}

$path = __DIR__ . '/file.txt';

//$chunkSize = 128;
$chunkSize = 1024;
$fileIterator = new FileIterator($path, $chunkSize);

foreach($fileIterator as $chunkPosition => $chunk) {
    echo $chunk;
}