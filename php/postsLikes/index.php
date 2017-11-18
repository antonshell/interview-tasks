<?php

require_once '_bootstrap.php';

$currentUser = getCurrentUser();
$sql = "SELECT p.id, p.title, p.content,l.user_id FROM `post` p
        LEFT JOIN `like` l 
        ON p.id = l.post_id AND l.user_id = :currentUser";

$stmt = $db->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
$stmt->bindValue(':currentUser',$currentUser);
$stmt->execute();
$posts = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Posts</title>

    <!-- Bootstrap core CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-blog-home/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>

    <body>
        <div class="container">
            <h1>Posts</h1>

            <a class="btn btn-primary" href="create.php">Create Post</a>

            <hr>

            <?php foreach ($posts as $post): ?>
                <div>
                    <h3><?= $post['title']; ?></h3>

                    <p><?= $post['content']; ?></p>

                    <?php
                    $hasLike = (boolean)$post['user_id'];
                    $action = $hasLike ? 'dislike.php' : 'like.php';
                    $label = $hasLike ? 'DisLike!' : 'Like!';
                    $class = $hasLike ? 'btn-warning' : 'btn-success';
                    ?>

                    <form action="<?= $action ?>" method="post">
                        <input type="hidden" name="postId" value="<?= $post['id'] ?>">
                        <input type="submit" class="btn <?= $class ?>" value="<?= $label ?>">
                    </form>

                </div>

                <hr>
            <?php endforeach; ?>
        </div>
    </body>

</html>