<?php

require_once '../models/Carousel.php';


if(isset($_GET['op'])){

  $carousel = new Carousel();

  // listar imagenes
  if($_GET['op'] == 'listarImagenes'){
    $data = $carousel->listarCarousel();

    if($data){
      echo json_encode($data);
    }
  }
}


?>