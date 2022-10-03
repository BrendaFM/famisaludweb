<?php


if(isset($_GET['op'])){

  // creación
  if($_GET['op'] == 'createCookieWelcome'){
    echo setcookie("welcome", "true", time() + 84600); // 1 día
  } 

  
  // Listado
  if($_GET['op'] == 'queryCookieWelcome'){
    $cookie = $_COOKIE['welcome']; 

    if(isset($cookie)){
      echo $cookie;
    } else {
      echo -1;
    }
  } 


}


?>