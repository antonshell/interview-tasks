<?php

require_once '_bootstrap.php';

$postId = $_POST['postId'];
$action = $_POST['action'];
$currentUser = getCurrentUser();

$sql = "INSERT INTO `like` (`user_id`, `post_id`) VALUES (:userId, :postId);";
$stmt = $db->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
$stmt->bindValue(':userId', $currentUser);
$stmt->bindValue(':postId', $postId);
$stmt->execute();

header('Location: index.php?r=index');
die();