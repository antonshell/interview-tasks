<?php

require '_bootstrap.php';

$limit = 10000;
$offset = 0;
$delay = 1;

$results = [];

for(;;){
    $rows = $db->run('SELECT id,email FROM users WHERE id > ? LIMIT ?', $offset, $limit);

    if(!count($rows)){
        break;
    }

    foreach ($rows as $row) {
        $userId = $row['id'];
        $emailCol = $row['email'];
        $emailCol = trim($emailCol);
        $emails = explode(',',$emailCol);

        echo "#user $userId \n";

        foreach ($emails as $email){
            if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                continue;
            }

            $parts = explode('@', $email);
            $provider = $parts[1];

            if(isset($results[$provider])){
                $results[$provider] += 1;
            }
            else{
                $results[$provider] = 1;
            }
        }
    }

    $offset += $limit;

    if($delay){
        sleep($delay);
    }
}

print_r($results);
die();