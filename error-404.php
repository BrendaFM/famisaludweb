<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
  <title>FamiSalud | Tu Salud en Buenas Manos</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  
  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <!-- Google Font: Source Sans Pro -->

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="assets/vendor/fontawesome-free/css/all.min.css">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- Owl-carousel  -->
  <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.carousel.min.css">
  <link rel="stylesheet" href="assets/vendor/owl-carousel/css/owl.theme.default.min.css">

  <!-- Animate slider -->
  <link rel="stylesheet" href="assets/css/animate-slider.css">
  <link rel="stylesheet" href="assets/css/carousel.css">

  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="assets/vendor/sweetalert2/sweetalert2.min.css">

  <!-- Sidebar right -->
  <link rel="stylesheet" href="assets/css/sidebar-right.css">
  <link rel="stylesheet" href="assets/css/slide-animate.css">

  <!-- Style aparence and color -->
  <link rel="stylesheet" href="assets/css/buttons.css">
  <link rel="stylesheet" href="assets/css/color-buttons.css">
  <link rel="stylesheet" href="assets/css/sections.css">
  <link rel="stylesheet" href="assets/css/card.css">

  <!-- Style pages -->
  <link rel="stylesheet" href="assets/css/pages.css">
  <link rel="stylesheet" href="assets/css/modal.css">
</head>
<body>
  <!-- ======== Container ============ -->
  <div class="wrapper">

    <!-- ======= Top Bar ======= -->
    <div id="topbar" class="d-flex align-items-center fixed-top d-flex justify-content-end">
      <div class="justify-content-center d-flex justify-content-md-end">

        <div class="contact-info d-none d-md-flex align-items-center">
          <a class="btn btn-covid btn-flat" data-bs-toggle="modal" href="#modalAmbulance" role="button">
            <i class="fas fa-ambulance icon-menu"></i>
            <span> Ambulancia Tipo II</span>
          </a>

          <div class="phone-numbers">
            <div class="phone">
              <a href="#" class="number">LIMA - Citas: (01)2 223 394</a>
            </div>
            <div class="phone">
              <a href="#" class="number">CHINCHA - Citas: (01)2 223 394</a>
            </div>
            <div class="phone">
              <a href="#" class="number">PISCO - Citas: (01)2 223 394</a>
            </div>
          </div>

          <a class="btn btn-success btn-whatsapp link-whatsapp" target="_blank" href="https://wa.me/945256369">
            <i class="fab fa-whatsapp icon-menu"></i>
            <span>Contáctanos</span>
          </a>
        </div>
      </div>
    </div>

    <!-- ======= Header ======= -->
    <header id="header" class="fixed-top d-flex align-items-center">
      <div class="content-header container-fluid container-xl d-flex align-items-center justify-content-lg-between">
        <a href="index.php" class="logo logo_fs">
          <img class="logo-color" src="assets/img/LOGO_NEW.png">
          <img class="logo-white" src="assets/img/LOGO_WHITE.png">
        </a>

        <!-- Uncomment below if you prefer to use an image logo -->
        <div class="align-items-center navbar-center justify-content-end">
          <nav id="navbar" class="navbar">
            <ul class="list-left">
              <li><a class="nav-link scrollto active" href="index.php?view=home"><i class="fas fa-hospital-alt icon-home"></i></a></li>
              <li><a class="nav-link scrollto" href="index.php?view=sede-only">Sedes</a></li>
              <li><a class="nav-link scrollto" href="index.php?view=staffmedico">Staff Médico</a></li>
              <li class="dropdown"><a href="index.php?view=servicio"><span>Servicios</span></a>
              </li>
              <li class="dropdown"><a href="index.php?view=salud-ocupacional" class="nav-link"><span>Salud Ocupacional</span></a>
                <ul class="d-none">
                  <li><a href="index.php?view=blogs">Blogs</a></li>
                  <li><a href="index.php?view=campanas"><span>Campañas</span></a>
                  </li>
                </ul>
              </li>
            </ul>

            <ul class="list-right">
              <li class="nav-link dropdown">
                <a href="javascript:void(0)" class="btn-resultonline">Resultados para Empresas</a>
                <ul>
                  <li><a target="_blank" href="http://www.famisalud.com.pe/ClientesMiraflores">Lima</a></li>
                  <li><a target="_blank" href="http://www.famisalud.com.pe/clienteschincha"><span>Chincha</span></a>
                  <li><a target="_blank" href="http://www.famisalud.com.pe/clientespisco"><span>Pisco</span></a>
                  </li>
                </ul>
              </li>
              <div class="content-menu-bars">
                <input type="checkbox" id="check-menu" class="check-menu">
                <label for="check-menu" class="menu-button">
                  <!-- <span></span> -->
                  <i class="fas fa-bars"></i>
                </label>
              </div>
            </ul>

          </nav><!-- .navbar -->
        </div>
      </div>
    </header><!-- End Header -->

    <!-- ======= Main ======= -->
    <main id="main">
      <div id="content-data">
        <!-- Datos asincronos -->
        <div class="container-page-error">

          <div class="box">
            <div class="box-header">
              <i class="fas fa-exclamation-triangle"></i>
              <span>!Error...!</span>
            </div>
            <div class="box-body">
              <h2>La página no existe</h2>
              <p>
                La página solicitada puede no estar disponible, o haber cambiado de dirección
              </p>
              <a href="index.php" class="btn btn-resultonline btn-round-50">Regresar al inicio</a>
            </div>
          </div>

        </div>
      </div>
    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">
      <div class="footer-top" data-aos="fade-up">
        <div class="container">
          <div class="container-sub">
            <img src="assets/img/LOGO_WHITE.png">

            <div class="content-subscription">
              <i class="fas fa-newspaper"></i>
              <div>
                <h2>Contáctanos</h2>
                <p>Entérate de nuestras novedades</p>
              </div>
            </div>
            <div class="content-form">
              <form autocomplete="off">
                <input type="email" id="email-suscripcion" placeholder="Correo Electrónico"><button type="button" id="btn-subscripcion">Enviar</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-body" data-aos="fade-up">
        <div class="container">
          <div class="row justify-content-lg-between align-items-center">
            <div class="col-md-3 form-group mb-3">
              <!-- <a href="index.html" class="logo logo_fs logo_fs_footer">
            <img src="assets/img/LOGO_NEW.png">
          </a> -->
              <div class="social-links">
                <a class="facebook" href="https://web.facebook.com/Clinicafamisaludoficial" target="_blank"><i class="fab fa-facebook-f"></i></a>
                <a class="instagram" href="https://www.instagram.com/clinicafamisaludoficial/" target="_blank"><i class="bx bxl-instagram"></i></a>
                <a class="linkedin" href="https://pe.linkedin.com/company/cl%C3%ADnica-famisalud" target="_blank"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>

            <div class="col-md-9 form-group">
              <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 form-group">
                  <h4><a href="mailto:clinicafamisaludc@gmail.com">Trabaja con Nosotros</a></h4>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 form-group">
                  <h4><a href="index.php?view=terminos-condiciones">Terminos y Condiciones</a></h4>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 form-group">
                  <h4><a href="index.php?view=politica-privacidad">Política y Privacidad</a></h4>
                </div>
              </div>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-lg-3 col-md-6">
              <div class="footer-info mb-2">
                <!-- <div class="social-links">
              <a class="tiktok" href="https://www.tiktok.com/@famisaludchincha" target="_blank"><i class="fab fa-tiktok"></i></a>
              <a class="instagram" href="https://www.instagram.com/clinicafamisaludoficial/" target="_blank" ><i class="bx bxl-instagram"></i></a>
              <a class="youtube" href="https://www.youtube.com/channel/UCEen2-VrwCnmn41j1IwzJDA" target="_blank" ><i class="fab fa-youtube"></i></a>
              <a class="linkedin" href="https://pe.linkedin.com/company/cl%C3%ADnica-famisalud" target="_blank" ><i class="bx bxl-linkedin"></i></a>
            </div> -->

                <p class="mt-3">
                  <strong>Correo Electrónico:</strong> famisalud@famisalud.com<br>
                </p>
                <p class="mt-1">
                  <strong>Teléfonos</strong> <br>
                  <strong>Lima: </strong> <a href="tel:51 956 369 366" class="link-tel">+51 956 369 366</a> <br>
                  <strong>Chincha: </strong> <a href="tel:51 956 369 366" class="link-tel">+51 956 369 366</a> <br>
                  <strong>Pisco: </strong> <a href="tel:51 956 369 366" class="link-tel">+51 956 369 366</a> <br>
                </p>
              </div>
            </div>

            <div class="col-lg-2 col-md-3 footer-links">
              <h4>Enlaces</h4>
              <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php">Inicio</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=home#sedes">Sedes<i class="fa fa-sort-amount-asc" aria-hidden="true"></i></a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=especialidades">Especialidades</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=staffmedico">Staff Médico</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=salud-ocupacional">Salud Ocupacional</a></li>
              </ul>
            </div>

            <div class="col-lg-3 col-md-3 footer-links">
              <h4>Nuestros Servicios</h4>
              <ul>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=servicio">Servicios</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=blogs">Ultimas Novedades</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=campanas">Campañas y Eventos</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=productos-farmacia">Farmacia</a></li>
                <li><i class="bx bx-chevron-right"></i> <a href="index.php?view=home#modalAmbulance" data-bs-toggle="modal" role="button">Ambulancia</a></li>
              </ul>
            </div>

            <div class="col-lg-4 col-md-6 footer-newsletter">
              <h4>Nuestra Clínica FamiSalud</h4>
              <p>
                Una de las Mejores Clínicas del Perú,
                Dedicada a Brindar una Atención Integral de Salud, Eficiente y Oportuna.
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="footer-bottom" data-aos="fade-up">
        <div class="container">
          <span>Copyright 2022 - Clínica FamiSalud. Todos los derechos reservados. </span>
        </div>
      </div>
    </footer><!-- End Footer -->
  </div>

    
  <!-- ======== Menu Right ============ -->
  <div id="sidebar-right" class="sidebar-right">
    <div class="content-sidebar">
      <div class="sidebar-header">
        <div class="d-flex align-items-center justify-content-lg-between">
          <a href="#" class="logo logo_fs me-auto me-lg-0"><img src="assets/img/LOGO_NEW.png" class="img-fluid"></a>
    
          <div class="content-menu-bars">
            <input type="checkbox" id="check-menu-sidebar" class="check-menu">
            <label for="check-menu-sidebar" class="menu-button">
              <!-- <span></span> -->
              <i class="fas fa-times"></i>
            </label>
          </div>
        </div>
      </div>

      <div class="sidebar-body">
        <div class="row mt-4">
          <div class="col-lg-6">
            <nav class="navbar-right">                      
              <ul>                
                <li class="title-menu text-danger">Emergencias</li>
                <li><a class="nav-link" href="index.php?view=home#modalAmbulance" data-bs-toggle="modal" role="button">Ambulancia Tipo II</a></li>
              </ul>  
              <ul>
                <li class="title-menu">Clínica</li>
                <li><a class="nav-link" href="index.php">Inicio</a></li>
                <li><a class="nav-link" href="index.php?view=sede-only">Sedes</a></li>
                <li><a class="nav-link" href="index.php?view=staffmedico">Staff Médico</a></li>
                <li><a class="nav-link" href="index.php?view=servicio"><span>Servicios</span></a></li>
                <li><a class="nav-link" href="index.php?view=especialidades">Especialidades</a></li>
                <li><a class="nav-link" href="index.php?view=about">¿Quienes somos?</a></li>
              </ul>     
              <ul>
                <li class="title-menu">Nuestros Servicios</li>
                <li><a class="nav-link" href="index.php?view=productos-farmacia">Farmacia</a></li>
                <li><a class="nav-link" href="index.php?view=salud-ocupacional">Salud Ocupacional</a></li>            
                <li><a class="nav-link" href="index.php?view=quotation">Cotizar protocolo</a></li>
              </ul>  
              
              <ul>                
                <li class="title-menu">Resultados para Empresas</li>
                <li><a class="nav-link" target="_blank" href="http://www.famisalud.com.pe/ClientesMiraflores">Lima</a></li>
                <li><a class="nav-link" target="_blank" href="http://www.famisalud.com.pe/clienteschincha"><span>Chincha</span></a>
                <li><a class="nav-link" target="_blank" href="http://www.famisalud.com.pe/clientespisco"><span>Pisco</span></a>
                </li>
              </ul>
            </nav><!-- .navbar -->
          </div>
          <div class="col-lg-6">
          <nav class="navbar-right">                
              <ul>                
                <li class="title-menu">Novedades y Eventos</li>
                <li><a class="nav-link" href="index.php?view=blogs">Ultimas Novedades</a></li>
                <li><a class="nav-link" href="index.php?view=campanas">Campañas y Eventos</a></li>
              </ul>    
              <ul>                
                <li class="title-menu">Otros enlaces</li>
                <li><a class="nav-link" href="#">Trabaja con Nosotros</a></li>
                <li><a class="nav-link" href="index.php?view=terminos-condiciones">Términos y Condiciones</a></li>
                <li><a class="nav-link" href="index.php?view=politica-privacidad">Política y Privacidad</a></li>
              </ul>          
            </nav><!-- .navbar -->
          </div>
        </div>
      </div>

      <div class="sidebar-footer d-none">    
          <a href="#book-a-table" class="btn-resultonline">Informes Ocupacional</a>
          <a class="btn btn-success btn-whatsapp link-whatsapp" href="https://wa.me/945256369">          
            <img src="assets/img/about/doctor.png">
            <span>Contactanos</span>
            <i class="fab fa-whatsapp icon-menu"></i>
          </a>
      </div>
    </div>
  </div>
  
  <!-- ======= Botón flotante ======= -->
  <div class="container-redsocials">
    <a href="https://web.facebook.com/Clinicafamisaludoficial" target="_blank" class="btn btn-float facebook call-animation"><i class="fab fa-facebook-f"></i></a>
    <a href="#" class="btn btn-float whatsapp link-whatsapp" target="_blank" ><i class="fab fa-whatsapp"></i></a>
    <a href="#" class="back-to-top"><i class="fas fa-arrow-up"></i></a>
  </div>

  <!-- Modal suscripción-->
  <div class="modal fade" id="modalSuscription" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-body">
         <div class="load-modal loading">Suscribiendo...</div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal ambulancia -->
  <div class="modal fade" id="modalAmbulance" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
      <div class="modal-content">
        <div class="modal-header border-0 pb-0">
          <h5 class="modal-title d-none" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          
          <div class="content-ambulance">  
            <div class="ambulance">
              <div class="content-text">
                <h2>Ambulancia Tipo II</h2>
                <p>
                Para el transporte asistido de pacientes, en estado crítico, cuenta con capacidad de asistencia médica.
                </p>
                <div class="d-flex justify-content-center align-items-center">
                  <a href="tel:51956256256" class="btn btn-round-50 btn-success btn-sm">
                    <i class="fas fa-phone-alt"></i> 
                    Chincha
                  </a>
                  <a href="tel:51956256256" class="btn btn-round-50 btn-success btn-sm">
                    <i class="fas fa-phone-alt"></i> 
                    Pisco
                  </a>
                  <a href="tel:51956256256" class="btn btn-round-50 btn-success btn-sm link-whatsapp">
                    <i class="fab fa-whatsapp"></i>
                    Whatsapp
                  </a>
                </div>
              </div>
              <div class="content-image">
                <img src="assets/img/ambulances/ambulance_7.jpg">                
              </div>
            </div>
                     
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/jquery/jquery.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  <script src="assets/js/utility.js"></script>
  <script src="assets/js/menu.js"></script>

  <!-- Owl-carousel -->
  <script src="assets/vendor/owl-carousel/js/owl.carousel.min.js"></script>

  <!-- SweetAlert 2 -->
  <script src="assets/vendor/sweetalert2/sweetalert2.min.js"></script>
  <script src="assets/js/sweetAlert2.util.js.js"></script>

  <!-- Load web -->
  <script src="assets/js/loadweb.js"></script>
</body>

</html>