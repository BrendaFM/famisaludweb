const audio = document.getElementById("content-audio");
var welcome = false;
var errorUrl = false;
var errorCount = 0;
var sound;
var validEmail = false;

// Cambiar color de fondo del HEADER al Intercambiar de página
if (getParamUrl('view') != 'home' && getParamUrl("view") != undefined) {
  $("#header").addClass('bg-active');
} else {
  $("#header").removeClass('bg-active');
}

$("#email-suscripcion").keyup(function () {
  let input = $(this);

  if (expressions.email.test(input.val())) {
    input.parent("form.control").removeClass("is-invalid");
    input.parent("form.control").addClass("is-valid");
    validEmail = true;
  } else {
    input.parent("form.control").removeClass("is-valid");
    input.parent("form.control").addClass("is-invalid");
    validEmail = false;
  }
});

// Suscripción
$("#btn-subscripcion").click(function () {
  let email = $("#email-suscripcion").val();

  if (email == "") {
    sweetAlertInformation("Por favor ingrese su correo electrónico");
  } else {
    if(!validEmail){
      sweetAlertError("Por favor ingrese un correo valido");
    } else {
      let dataSend = {
        "op": "sendMail",
        "subject": "SUSCRIPCIÓN",
        "message": "<strong style='color: darkblue;'>Email: </strong>" + email
      }
  
      $("#modalSuscription").modal("show");
  
      $.ajax({
        url: 'controllers/Mailer.controller.php',
        type: 'GET',
        data: dataSend,
        success: function (res) {
  
          if (res == "") {
            $("#email-suscripcion").val(null);
            $("#modalSuscription .load-modal").removeClass("loading");
            $("#modalSuscription .load-modal").html("Suscripción realizada con éxito");
  
            setTimeout(() => {
              $("#modalSuscription .load-modal").addClass("loading");
              $("#modalSuscription").modal("hide");
            }, 1500);
          }
        }
      });
    }
  }

});


/**
 * Preloader - Cargado desde menu.js
 */
if (preloader) {
  window.addEventListener('load', () => {
    //showPresentation();
    //errorPagina();  
  });
}


/* 
 * LINK WHATSAPP
 */
function addLinkWhatsapp() {
  let number = "922126202";
  $(".link-whatsapp").attr("href", "https://wa.me/" + number);
}


function showPresentation() {
  if (getParamUrl('view') == 'home' || getParamUrl('view') == undefined) {
    sweetAlertWelcome("Bienvenido a tu Clínica");
    //howlerAudio();

    queryCookieWelcome();

    //playAudio();
    if (!welcome) {
      createCookieWelcome();
    }
  }
}

function howlerAudio() {
  sound = new Howl({
    src: ['assets/audio/saludo.mp3'],
    volume: 1.0,
    onend: function () {
      console.log("fin repro");
    }
  });
  sound.play();
}

function playAudio() {
  audio.innerHTML = '<audio controls autoplay src="assets/audio/saludo.mp3" type="audio/mp3"></audio>';
}

function createCookieWelcome() {
  $.ajax({
    url: 'controllers/Cookie.controller.php',
    type: 'GET',
    data: 'op=createCookieWelcome',
    success: function (res) {
      if (res == 1) {
        welcome = true;
      }
    }
  });
}

function queryCookieWelcome() {
  $.ajax({
    url: 'controllers/Cookie.controller.php',
    type: 'GET',
    data: 'op=queryCookieWelcome',
    success: function (res) {
      if (res !== -1) {
        welcome = true;
      }
    }
  });
}