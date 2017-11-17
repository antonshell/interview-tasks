<?php
/**
 * USAGE:
 *
 * php test.php [({})]
 * Correct!
 *
 * php test.php [([)
 * Incorrect!
 */

/**
 * @param $seq
 * @return bool
 */
function checkSequence($seq){
    $isValid = true;
    $stack = [];

    $pairs = [
        ']' => '[',
        ')' => '(',
        '}' => '{',
    ];

    $open = array_values($pairs);

    for($i=0; $i<strlen($seq); $i++){
        $current = $seq[$i];

        if(in_array($current,$open)){
            array_push($stack,$current);
        }
        else{
            if(empty($stack)){
                $isValid = false;
                break;
            }

            $last = array_pop($stack);

            if($last != $pairs[$current]){
                $isValid = false;
                break;
            }
        }
    }

    if(!empty($stack)){
        $isValid = false;
    }

    return $isValid;
}


// get argument
if(!isset($argv[1])){
    echo "Please enter sequence";
    die();
}
$seq = $argv[1];

//check sequence for not allowed chars
$allowedChars = [']', '[', ')', '(', '}', '{'];
for($i=0; $i<strlen($seq); $i++){
    $current = $seq[$i];

    if(!in_array($current,$allowedChars)){
        echo "Sequence is not correct";
        die();
    }
}

echo checkSequence($seq) ? 'Correct!' : 'Incorrect!';
