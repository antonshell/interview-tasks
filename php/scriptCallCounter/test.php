<?php

if(!file_exists("./counter.txt")){
    file_put_contents("./counter.txt", 0);
}

if(!file_exists("./lock.txt")){
    file_put_contents("./lock.txt", 0);
}

for($i=0; $i<10; $i++){
    echo $i . "\n";

    $filename = "./counter.txt";
    $lock = "./lock.txt";
    $handle = fopen($lock, 'r+');
    while (!flock($handle,  LOCK_EX)) {
        echo "usleep\n";
        usleep(1);
    }
    file_put_contents($filename, file_get_contents($filename) + 1);

    sleep(5);

    flock($handle, LOCK_UN);
    fclose($handle);
}
