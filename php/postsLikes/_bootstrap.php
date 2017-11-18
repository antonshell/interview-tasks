<?php

$connection = 'mysql:host=localhost;dbname=fotostrana_likes';
$username = 'root';
$password = '';

$db = new PDO($connection, $username, $password);

$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
if(!$db){
    throw new Exception("Cann't connect to database");
}

/**
 * @return int
 */
function getCurrentUser(){
   return 1;
}