<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Origin, X-Requested-With");
header("Access-Control-Allow-Methods: POST, GET");
header("Content-Type: text/plain; charset=UTF-8");

// linuxのlocaleによって変える
putenv("LANG=C.UTF-8");
// putenv("LANG=ja_JP.UTF-8");

define('base', './API');
define('xi', '"' . $_POST['xi'] . '"');
define('ga', '"' . $_POST['ga'] . '"');
define('term', '"' . $_POST['term'] . '"');

if ($_POST['isInit'] == 'true') {
    define('num', '"' . $_POST['num'] . '"');
}

if ($_POST['isUntyped'] == 'true') {
    define('option', '-u');
} else {
    define('option', '');
}

if ($_POST['isInit'] == 'true') {
    $cmd = base . ' init ' . option . ' ' . xi . ' ' . ga . ' ' . term;
} else {
    $cmd = base . ' red ' . option . ' ' . xi . ' ' . ga . ' ' . term . ' ' . num;
}

exec($cmd, $opt, $ret);

for ($i = 0; $i < count($opt); $i++) {
    echo $opt[$i] . '<br>';
}

?>
