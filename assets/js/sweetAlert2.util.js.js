// Configuración del sweetAlert de avisos
function sweetAlertConfig($dataconfig){
  Swal.fire({
    icon: $dataconfig.icon,
    title: "FamiSalud",
    position: 'center',
    text: $dataconfig.message,
    timer: $dataconfig.timer,
    timerProgressBar: true,
    confirmButtonColor: '#5D6D7E',
    showClass: {
      popup: 'animate__animated animate__fadeInDown'
    },
    hideClass: {
      popup: 'animate__animated animate__fadeOutUp'
    }
  });
}

function sweetAlertWelcome(message){
  Swal.fire({
    title: "FamiSalud",
    position: 'center',
    text: message,
    timer: 2000,
    imageUrl: 'assets/img/about/doctor.png',
    imageWidth: 200,
    imageHeight: 200,
    imageAlt: 'Custom image',
    timerProgressBar: true,
    confirmButtonColor: '#5D6D7E',
    showClass: {
      popup: 'animate__animated animate__fadeInDown'
    },
    hideClass: {
      popup: 'animate__animated animate__fadeOutUp'
    }
  });
}

function sweetAlertInformation(message){
  sweetAlertConfig({
    icon    : 'info',
    message : message,
    timer   : 1600
  });
}

function sweetAlertError(message){
  sweetAlertConfig({
    icon    : 'error',
    message : message,
    timer   : 1700
  });
}

function sweetAlertWarning(message){
  sweetAlertConfig({
    icon    : 'warning',
    message : message,
    timer   : 1600
  });
}

function sweetAlertSuccess(message){
  sweetAlertConfig({
    icon    : 'success',
    message : message,
    timer   : 1300
  });
}

// Configuración del sweetAlert de pregunta
function confirmQuestionConfig($dataconfig){
  return Swal.fire({
    title: "FamiSalud",    
    text: $dataconfig.question,
    position: 'center',
    icon: 'question',
    showCancelButton: true,
    confirmButtonColor: $dataconfig.confirmColor,
    confirmButtonText: '<i class="fas fa-check"></i> Aceptar',
    cancelButtonText: '<i class="fas fa-times"></i> Cancelar',
    buttonsStyling: true,
    reverseButtons: true
  });
}

function sweetAlertConfirmQuestionSave(question){
  return confirmQuestionConfig({
    question    : question,
    confirmColor: '#2471A3'
  });
}

function sweetAlertConfirmQuestionDelete(question){
  return confirmQuestionConfig({
    question    : question,
    confirmColor: '#C0392B'
  });
}