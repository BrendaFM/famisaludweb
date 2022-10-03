<?php
use PHPMailer\PHPMailer\PHPMailer;  // Core (Nucleo)
use PHPMailer\PHPMailer\Exception;  // Contralador de expecepiones(Errores)
use PHPMailer\PHPMailer\SMTP;       // Administra protocolo envio correo

require '../assets/vendor/PHPMailer/src/Exception.php';
require '../assets/vendor/PHPMailer/src/PHPMailer.php';
require '../assets/vendor/PHPMailer/src/SMTP.php';

class Mailer{
  // Atributo
  private $mail;

  // Constructor 
  public function __CONSTRUCT(){
      //Instancia 
      $this->mail = new PHPMailer(true);
  }

  // Enviar correo
  function sendMail($asunto, $message){ 
    try{
  
      //Server settings
      $this->mail->SMTPDebug = 0;                                       //Enable verbose debug output
      $this->mail->isSMTP();                                            //Send using SMTP
      $this->mail->Host       = 'smtp.gmail.com';                       //Set the SMTP server to send through
      $this->mail->SMTPAuth   = true;                                   //Enable SMTP authentication
      $this->mail->Username   = 'clinicafamisaludc@gmail.com';          //SMTP username
      $this->mail->Password   = 'qlgdmczhcokkumkz';                               //SMTP password
      $this->mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
      $this->mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
    
      //Recipients
      $this->mail->setFrom('clinicafamisaludc@gmail.com', 'Clínica FamiSalud');
    
      // Copias del correo
      $this->mail->addAddress("cuevabill12@gmail.com");                                   //Destinatarios
    
      //Content
      $this->mail->isHTML(true);                            
      $this->mail->Subject = $asunto;
      $this->mail->Body    = $message;
      $this->mail->AltBody = $message;
    
      $this->mail->CharSet = 'UTF-8';
      $this->mail->send();
      echo "";
    }
    catch (Exception $e){
      echo "No se ha podido enviar el correo electrónico: {$this->mail->ErrorInfo}";
    }
  } 
}
?>