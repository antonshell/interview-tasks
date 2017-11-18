<?php

require 'vendor/autoload.php';

$db = \ParagonIE\EasyDB\Factory::create(
    'mysql:host=localhost;dbname=fotostrana_test',
    'root',
    ''
);

// https://gist.github.com/tbrianjones/5992856
$providers = [
    '1033edge.com',
    '11mail.com',
    '123.com',
    '123box.net',
    '123india.com',
    '123mail.cl',
    '123qwe.co.uk',
    '150ml.com',
    '15meg4free.com',
    '163.com',
    '1coolplace.com',
    '1freeemail.com',
    '1funplace.com',
    '1internetdrive.com',
    '1mail.net',
    '1me.net',
    '1mum.com',
    '1musicrow.com',
    '1netdrive.com',
    '1nsyncfan.com',
    '1under.com',
    '1webave.com',
    '1webhighway.com',
    '212.com',
    '24horas.com',
    '2911.net',
    '2bmail.co.uk',
    '2d2i.com',
    '2die4.com',
    '3000.it',
    '321media.com',
    '37.com',
    '3ammagazine.com',
    '3dmail.com',
    '3email.com',
    '3xl.net',
    '444.net',
    '4email.com',
    '4email.net',
    '4mg.com',
    '4newyork.com',
    '4x4man.com',
    '5iron.com',
    '5star.com',
    '88.am',
    '8848.net',
    '888.nu',
    '97rock.com',
    'aaamail.zzn.com',
    'aamail.net',
    'aaronkwok.net',
    'abbeyroadlondon.co.uk',
    'abcflash.net',
    'abdulnour.com',
    'aberystwyth.com',
    'abolition-now.com',
    'about.com',
    'academycougars.com',
    'acceso.or.cr',
    'access4less.net',
    'accessgcc.com',
    'ace-of-base.com',
    'acmecity.com',
    'acmemail.net',
    'acninc.net',
    'adelphia.net',
    'adexec.com',
    'adfarrow.com',
    'adios.net',
    'ados.fr',
    'advalvas.be',
    'aeiou.pt',
    'aemail4u.com',
    'aeneasmail.com',
    'afreeinternet.com',
    'africamail.com',
    'agoodmail.com',
    'ahaa.dk',
    'aichi.com',
    'aim.com',
    'airforce.net',
    'airforceemail.com',
    'airpost.net',
    'ajacied.com',
    'ak47.hu',
    'aknet.kg',
    'albawaba.com',
    'alex4all.com',
    'alexandria.cc',
    'algeria.com',
];

$faker = Faker\Factory::create();

define('USERS_COUNT',1000000);
//define('USERS_COUNT',1000);

$statement = $db->prepare('TRUNCATE TABLE users')->execute();

for($i=1; $i<=USERS_COUNT; $i++){
    $emailCnt = rand(0,4);
    $email = '';

    for($j=0; $j<$emailCnt; $j++){
        $provider = $providers[array_rand($providers)];
        $email .= $faker->userName  . '@' . $provider . ',';
    }

    $email = trim($email,',');

    $user = [
        'id' => $i,
        'name' => $faker->firstName(),
        'gender' => rand(1,2),
        'email' => $email,
    ];

    $db->insert('users', $user);
    echo "#user $i\n";
}