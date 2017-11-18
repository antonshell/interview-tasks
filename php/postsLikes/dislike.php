<?php

require_once '_bootstrap.php';

$postId = $_POST['postId'];
$currentUser = getCurrentUser();

$sql = "DELETE FROM `like` WHERE `user_id` = :userId AND `post_id` = :postId;";
$stmt = $db->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
$stmt->bindValue(':userId', $currentUser);
$stmt->bindValue(':postId', $postId);
$stmt->execute();

header('Location: index.php?r=index');
die();