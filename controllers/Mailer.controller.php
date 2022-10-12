<?php 

// Icorporando al modelo
require_once '../models/Mailer.php';

$mailer = new Mailer();

if(isset($_GET['op'])){

  // Enviar solicitud
  if($_GET['op'] == 'sendMail'){
    $mailer->sendMail($_GET['subject'], $_GET['message']);
  }
}

if(isset($_POST['op'])){

  // Enviar correo validado con el captcha
  if($_POST['op'] == 'sendMail'){
    $ip = $_SERVER['REMOTE_ADDR'];
    $captcha = $_POST['g-recaptcha-response'];
    $secretkey = "6Le_NDIiAAAAAP2ATjdp9VM71VOG5YAfNzV8WwuZ";
    $response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secretkey&response=$captcha&remoteip=$ip");
  
    $attributes = json_decode($response, TRUE);
    $error = "";
  
    if(!$attributes['success']){
      $error = "Verificar captcha";
    } else {
      $mailer->sendMail($_POST['subject'], $_POST['message']);
    }
  
    echo $error;
  }

}


?>