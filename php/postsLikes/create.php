<?php

require_once '_bootstrap.php';

$error = '';
$contentMaxLength = 243;

$sql = "SELECT * FROM `category`";
$stmt = $db->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
$stmt->execute();
$categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $title = $_POST['title'];
    $content = $_POST['content'];
    $categoryId = $_POST['category_id'];

    if($title === ''){
        $error .= 'Title is Required<br>';
    }

    if($content === ''){
        $error .= 'Content is Required<br>';
    }

    if(strlen($content) > $contentMaxLength){
        $error .= 'Content is too long<br>';
    }

    if(!$error){
        $sql = "INSERT INTO `post` (`title`, `content`, `category_id`) VALUES (:title, :content, :categoryId);";
        $stmt = $db->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        $stmt->bindValue(':title', $title);
        $stmt->bindValue(':content', $content);
        $stmt->bindValue(':categoryId', $categoryId);
        $stmt->execute();

        header('Location: index.php?r=index');
        die();
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Create Post</title>

    <!-- Bootstrap core CSS -->
    <link href="https://blackrockdigital.github.io/startbootstrap-blog-home/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
    <body>
        <div class="container">
            <div class="col-md-6">
                <h1>Create Post</h1>

                <?php if($error): ?>
                    <div class="alert alert-danger">
                        <?= $error ?>
                    </div>
                <?php endif; ?>

                <form action="" method="post">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" name="title">
                    </div>
                    <div class="form-group">
                        <label for="pwd">Content</label>
                        <input type="text" class="form-control" name="content">
                    </div>

                    <div class="form-group field-remote-type-1 required has-success">
                        <label class="control-label" for="remote-type-1">Тип</label>

                        <select class="form-control" name="category_id">
                            <?php foreach ($categories as $category): ?>
                                <option value="<?= $category['id'] ?>"><?= $category['name'] ?></option>
                            <?php endforeach;?>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </div>
    </body>
</html>