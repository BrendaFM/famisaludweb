tmpSede = templateSede;
tmpCamapana = templateCampana;

var validatedInputs = {
  name: false,
  phone: false,
  email: false,
  business: false,
  message: false
}

$('.owl-carousel').owlCarousel({
  dots: false,                    // Leyenda de pagina
  loop: true,                     // Repetir
  autoplay: true,
  autoplayTimeout: 1600,
  autoplayHoverPause: true,
  margin: 25,                     // Margen
  nav: false,                       // Navegación
  autoWidth: false,               // Ajustar ancho
  autoHeight: true,               // Ajustar altura
  autoHeightClass: 'owl-height',  // Clase CSS
  autoWidthClass: 'owl-width',    // Clase CSS
  responsiveClass: true,
  items: 3,
  stagePadding: 28,
  animateOut: 'slideOutDown',
  animateIn: 'flipInX',
  smartSpeed: 500,
  responsive: {
    0: {
      items: 1
    },
    600: {
      items: 1,
      stagePadding: 1
    },
    1260: {
      items: 2,
      stagePadding: 1
    },
    1460: {
      items: 3,
      stagePadding: 3
    }
  }
});


// Cargar imagenes del carousel principal
function loadCarouselMain() {
  $.ajax({
    url: 'controllers/Carousel.controller.php',
    type: 'GET',
    data: 'op=listarImagenes',
    success: function (result) {
      let data = JSON.parse(result);
      var arrayIDs = [];

      data.forEach(value => {
        let tmp = templateCarouselHeader;
        arrayIDs.push(value.idcarousel);

        for (key in value) {
          tmp = tmp.replaceAll('{' + key + '}', value[key]);
        }

        $("#carousel-famisalud .carousel-inner").append(tmp);
        $(`#carousel-famisalud .carousel-inner .img-carousel[data-idcarousel='${value.idcarousel}']`).attr('src', '../famisaludwebadmin/img/carousel/' + value.foto);

      });

      $(`#carousel-famisalud .carousel-inner .carousel-item[data-idcarousel='${arrayIDs[0]}']`).addClass("active");
    }
  });
}

// Cargar sedes en la pantalla principal
function loadSedes() {
  $.ajax({
    url: 'controllers/Sede.controller.php',
    type: 'GET',
    data: 'op=listSedes',
    success: function (result) {
      let data = JSON.parse(result);
      data.forEach(value => {

        let sedeTmp = tmpSede;
        for (key in value) {
          sedeTmp = sedeTmp.replaceAll('{' + key + '}', value[key]);
        }

        $("#sedes .content-sedes").append(sedeTmp);
        $(`#sedes .content-sedes .img-sede[data-idsede='${value.idsede}']`).attr('src', '../famisaludwebadmin/img/sede/' + value.fotografia);

      });
    }
  });
}

// cargar campañas en la pantalla principal (solo 2)
function loadCampanas() {
  $.ajax({
    url: 'controllers/Campana.controller.php',
    type: 'GET',
    data: 'op=listarCampanasRandom',
    success: function (result) {

      if(result != ""){
        let data = JSON.parse(result);
  
        data.forEach(value => {
  
          let campana = tmpCamapana;
          for (key in value) {
            campana = campana.replaceAll('{' + key + '}', value[key]);
          }
  
          $("#events .content-events").append(campana);
          $(`#events .content-events .img-campana[data-idcampana='${value.idcampana}']`).attr('src', '../famisaludwebadmin/img/campana/' + value.fotografia);
  
        });
      }

    }
  });
}

// Enviar correo 
function sendMail(formData) {
  toggleClassVisible(".loading", true);

  $.ajax({
    url: 'controllers/Mailer.controller.php',
    type: 'POST',
    data: formData,
    contentType: false,
    processData: false,
    cache: false,
    success: function (res) {
      toggleClassVisible(".loading", false);
      console.log(res);
      if (res == "") {
        showTextTemp(".sent-message", "Enviado correctamente");
      } else {
        showTextTemp(".error-message", res);
      }
    }
  });
}

// removeClass texto
function toggleClassVisible(selector, visible) {
  if (visible) {
    $(`#form-solicitud ${selector}`).addClass("show-message");
  } else {
    $(`#form-solicitud ${selector}`).removeClass("show-message");
  }
}

function showTextTemp(selector, message) {
  toggleClassVisible(selector, true);
  $(`#form-solicitud ${selector}`).html(message);

  setTimeout(() => {
    toggleClassVisible(selector, false);
    $(`#form-solicitud ${selector}`).html(null);
  }, 2000);
}



// Ejecuta de forma automatica
$("#name").keyup(function () {
  validatedInputs.name = validateInput(expressions.name, $(this));
});

$("#razonsocial").keyup(function () {
  validatedInputs.business = validateInput(expressions.any, $(this));
});

$("#message").keyup(function () {
  validatedInputs.message = validateInput(expressions.any, $(this));
});

$("#phone").keyup(function () {
  validatedInputs.phone = validateInput(expressions.phone, $(this));
});

$("#email").keyup(function () {
  validatedInputs.email = validateInput(expressions.email, $(this));
});


// Click para enviar solicitud
$("#btn-sendMailer").click(function () {
  let name = $("#name").val();
  let razonsocial = $("#razonsocial").val();
  let phone = $("#phone").val();
  let email = $("#email").val();
  let message = $("#message").val();

  let captcha = grecaptcha.getResponse();

  let contentBody = "<strong>Nombre: </strong>" + name +
    "<br> <strong>Empresa: </strong>" + razonsocial +
    "<br> <strong>Telefono: </strong> <a href='tel: " + phone + "'>" + phone + "</a>" +
    "<br> <strong>Email: </strong>" + email +
    "<br><br> <strong style='color: green;'>Mensaje</strong> <p>" + message + "</p>";


  if (name == "" || razonsocial == "" || email == "" || message == "") {
    showTextTemp(".error-message", "Por favor complete sus datos");
  } else {

    if (!validatedInputs.name || !validatedInputs.phone || !validatedInputs.email || !validatedInputs.business || !validatedInputs.message) {
      showTextTemp(".error-message", "Verificar los datos");
    } else {

      var formData = new FormData();

      formData.append("op", "sendMail");
      formData.append("subject", "SOLICITUD");
      formData.append("g-recaptcha-response", captcha);
      formData.append("message", contentBody);

      sendMail(formData);

    }
  }
});

// Evento click del botón sede
$("#sedes").on("click", ".content-sedes .link-sede", function (e) {
  e.preventDefault();
  let idsede = $(this).attr("data-idsede");
  console.log("Hello", idsede);

  // Redireccionar 
  localStorage.setItem("idsede", idsede);
  window.location.href = "index.php?view=detallesede";
});


function demoColor() {
  $.ajax({
    url: 'controllers/Color.controller.php',
    type: 'GET',
    data: 'op=bgCardHover',
    success: function (res) {
      var data = JSON.parse(res);
      console.log(data);
      console.log(data[0].bg);

      $("#sedes .content-sedes .item-sede > .content-hover").css({ "background": `${data[0].bg}` });
    }
  });
}

//demoColor();

loadCarouselMain();
loadSedes();
loadCampanas();