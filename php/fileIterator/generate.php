<?php

$filePath = __DIR__ . '/file.txt';

unlink($filePath);

$fh = fopen($filePath, 'w');
$size = 1024 * 1024 * 1024 * 2; // 2Gb
//$size = 1024 * 1024 * 1024 * 0.2; // 0.2Gb
$chunk = 1024;
while ($size > 0) {
    $padStr = $size % 10;
    echo "$size \n";
    fputs($fh, str_pad($padStr, min($chunk,$size),$padStr));
    $size -= $chunk;
}
fclose($fh);