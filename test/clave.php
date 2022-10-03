<?php


$input = "123";
$clave = password_hash($input, PASSWORD_BCRYPT);

echo $clave;

?>