<?php

/**
 * @param $number1
 * @param $number2
 * @return string
 */
function bigSum($number1,$number2){
    if(!ctype_digit($number1) || !ctype_digit($number2)){
        throw new  Exception('Wrong parameters passed. Digits only allowed');
    }

    $number1 = (string)$number1;
    $number2 = (string)$number2;

    $sum = '';

    $maxLength = max(strlen($number1),strlen($number2));

    $number1 = str_pad($number1,$maxLength,'0',STR_PAD_LEFT);
    $number2 = str_pad($number2,$maxLength,'0',STR_PAD_LEFT);

    $rememberDigit = 0;
    
    for($i=$maxLength-1; $i >= 0; $i--){
        $n1 = $number1[$i];
        $n2 = $number2[$i];

        $ns = $n1 + $n2 + $rememberDigit;

        if($ns >= 10){
            $rememberDigit = 1;
            $ns = $ns % 10;
        }
        else{
            $rememberDigit = 0;
        }

        $sum[$i] = $ns;
    }

    if($rememberDigit){
        $sum = $rememberDigit . $sum;
    }

    echo $number1 . "\n";
    echo $number2 . "\n";
    echo $sum . "\n";

    return $sum;
}

$number1 = '333333333333333333333333333333333';
$number2 = '666666666666666666666666666666666';

$number3 = bigSum($number1,$number2);