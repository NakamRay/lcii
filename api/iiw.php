<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Origin, X-Requested-With");
header("Access-Control-Allow-Methods: POST, GET");
header("Content-Type: text/plain; charset=UTF-8");

putenv("LANG=ja_JP.UTF-8");

if ($_POST['isUntyped'] == 'true') {
    $cmd = '../programs/IIWUntyped "' . $_POST['term'] . '" ' . $_POST['num'];
} else {
    $cmd = '../programs/IIW "' . $_POST['ga'] . '" "' . $_POST['term'] . '" ' . $_POST['num'];
}

exec($cmd, $opt, $ret);

for ($i = 0; $i < count($opt); $i++) {
    echo $opt[$i] . '<br>';
}

?>
