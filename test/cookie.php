<?php

// Expira en 24 horas
// Creación
setcookie("usuario", "admin", time() + 84600);

// Lectura
echo $_COOKIE['usuario'];

// Eliminar
//setcookie("usuario", "admin", time() - 84600);


if(count($_COOKIE) > 0){
  echo "Cookie soportado";
} else {
  echo "Cookie no soportado";
}

?>