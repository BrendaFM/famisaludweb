<div class="page-header">
    <div class="container">
        <h1 class="title">Para empresas</h1>
    </div>
</div>

<div class="container-data">
    <div class="container container-ocupacional" data-aos="fade-up">
        <!-- box -->
        <div class="card card-body mb-2 content-top bg-cyan" data-aos="fade-up">
            <h5>Pre Ocupacional</h5>
            <h5>Periódico</h5>
            <h5>Cambio de Puesto</h5>
            <h5>Retiro</h5>
        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card mt-2 bg-blue " data-aos="fade-right" >

                    <div class="card-body">
                        <h5 class="card-title fw-bold text-uppercase text-center">Selecciona tu sede</h5>
    
                        <select class="form-select form-control btn-round-50 text-gray" id="idsede">
                            <!-- Asíncrono -->
                        </select>
                    </div>
                </div>

                <div class="card mt-4  card-outline-blue card-visible d-none" data-aos="fade-right" data-aos-delay="100">
                    <div class="card-header ">
                        Ubicación
                    </div>
                    <div class="card-body">
                        <div class="content-text d-flex flex-column">
                            <h4 class="direction" id="ubicacion">Av. Inca Garcilaso de la Vega</h4>    
                            <a href="#" class="link-gps" id="linkubisede"><i class="fas fa-map-marker-alt"></i> ¿Cómo llegar?</a>
                        </div>
                    
                    </div>
                </div>

                <div class="card mt-4 card-outline-blue card-visible d-none" data-aos="fade-right" data-aos-delay="200">
                    <div class="card-header">
                        Contactos
                    </div>
                    <div class="card-body d-flex flex-column gap-2">
                        <a href="#" id="email-link" class="email"><i class="far fa-envelope"></i> Corrreo </a>
                        <!-- <a href="#" class="whatsapp"><i class="fas fa-phone-alt"></i> Llamar</a> -->
                        <a href="#" id="whatsapp"><i class="fab fa-whatsapp"></i> Whatsapp</a>
                        
                    </div>
                </div>

                <div class="card mt-4 border-primary text-primary" data-aos="flip-left" data-aos-delay="200">
    
                    <div class="card-body d-flex flex-column gap-2">
                        <p>
                        La salud ocupacional se ocupa de todo lo relacionado con la salud y seguridad en el lugar de trabajo y presta especial atención a la prevención primaria de riesgos. La salud de los trabajadores tiene varios factores determinantes.
                        </p>
                        <a href="index.php?view=quotation" class="btn btn-famisalud btn-round-50 pd-15">Cotizar Protocolo</a>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <!-- Right -->
                <div class="content-carousel" data-aos="fade-left" data-aos-delay="200">
                    <div class='owl-carousel  carousel-md'>
                        <!-- Item 1 -->
                        <div class="item">
                            <img src="assets/img/ocupacional/ocupacional_12.jpg">
                            <div class="content-hover">
                                <h4>Atención In Situs</h4>
                            </div>
                        </div>
                        <!-- end Item 1 -->

                        <!-- Item 2 -->
                        <div class="item">
                            <img src="assets/img/ocupacional/ocupacional_13.jpg">
                            <div class="content-hover">
                                <h4>Cuidamos a tus Trabajadores</h4>
                            </div>
                        </div>
                        <!-- end Item 2 -->

                        <!-- Item 3 -->
                        <div class="item">
                            <img src="assets/img/ocupacional/ocupacional_14.jpg">
                            <div class="content-hover">
                                <h4>Contamos con los Mejores Precios</h4>
                            </div>
                        </div>
                        <!-- end Item 3 -->

                        <!-- Item 3 -->
                        <div class="item">
                            <img src="assets/img/ocupacional/ocupacional_15.jpg">
                            <div class="content-hover">
                                <h4>Atención de Calidad</h4>
                            </div>
                        </div>
                        <!-- end Item 3 -->
                    </div>
                </div>

                <hr>

                <div class="container-cards">                     
                            
                    <div class="box" data-aos="fade-left" >
                        <h5>Equipos de Ultima Tecnologia</h5>
                    </div>
                    <div class="box" data-aos="fade-left" >
                        <h5>Servicios de Calidad</h5>
                    </div>
                    <div class="box" data-aos="fade-left" >
                        <h5>Levantamiento de Interconsulta</h5>
                    </div>

                    <div class="box" data-aos="fade-left" >
                        <h5>Examenes complementarios</h5>
                    </div>

                    <div class="box" data-aos="fade-left" >
                        <h5>Refrigerios para Grupos</h5>
                    </div>

                    <div class="box" data-aos="fade-left" >
                        <h5>Plan de Emergencia para cada empresa</h5>
                    </div>

                    <div class="box" data-aos="fade-left" >
                        <h5>Capacitaciones y Charlas Gratuitas</h5>
                    </div>

                    <div class="box" data-aos="fade-left" >
                        <h5>Campañas y Atención In Situ</h5>
                    </div>
                </div>
            </div>
        </div>

        <hr>

        <div class="content-publication" id="lista-ocupacional">
            <!-- <div class="box-public" data-aos="fade-right">
                <div class="left">
                    <img src="img/aaa.jpg" alt="">
                </div>
                <div class="right">
                    <h4 class="fw-bold">Titulo</h4>
                    <p>
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Magni, accusamus officia exercitationem similique laboriosam nostrum, quia ducimus veritatis, id quo illo amet ipsum. Repudiandae, officiis laborum, illo ducimus consequuntur reprehenderit non quidem ipsam autem ratione itaque neque quas, omnis molestiae ut quisquam doloribus ab. Architecto ad voluptatibus fugiat tempore consequatur!
                    </p>
                </div>                
            </div> -->
       
        </div>

    </div>
</div>


<script>
    $(document).ready(function() {
        $('.carousel-md').owlCarousel({
            dots: false, // Leyenda de pagina
            loop: true, // Repetir
            autoplay: true,
            autoplayTimeout: 1600,
            autoplayHoverPause: true,
            margin: 25, // Margen
            nav: false, // Navegación
            autoWidth: false, // Ajustar ancho
            autoHeight: true, // Ajustar altura
            autoHeightClass: 'owl-height', // Clase CSS
            autoWidthClass: 'owl-width', // Clase CSS
            responsiveClass: true,
            items: 2,
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
                    items: 2,
                    stagePadding: 3
                }
            }
        });


        $('.owl-carousel').owlCarousel({
            dots: false, // Leyenda de pagina
            loop: true, // Repetir
            autoplay: true,
            autoplayTimeout: 1600,
            autoplayHoverPause: true,
            margin: 25, // Margen
            nav: false, // Navegación
            autoWidth: false, // Ajustar ancho
            autoHeight: true, // Ajustar altura
            autoHeightClass: 'owl-height', // Clase CSS
            autoWidthClass: 'owl-width', // Clase CSS
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

        function SedesCargar() {
            var datosEnviar = {
                'op': 'listarSede'
            };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result) {
                    $("#idsede").html(result);
                }
            });
        }

        function listarDatos(){
            $.ajax({
                url: 'controllers/SaludOcupacional.controller.php',
                type: 'GET',
                data: 'op=listarSaludOcupacional',
                success: function(res){
                    if(res != ""){
                        $("#lista-ocupacional").html(res);
                    }
                }
            });
        }

        function listarContactos(idsede){      
            $(".card-visible").removeClass('d-none');    

            var datosEnviar = {
                'op'            : 'listarTelefono',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){                
                    if(result != ""){
                        var data = JSON.parse(result);
    
                        $("#linkubisede").attr("href", data[0].ubicacion);
                        $("#ubicacion").html(data[0].direccion);
                        $("#email-link").attr("href", data[0].correo);
                        $("#whatsapp").attr("href", "https://wa.me/" + data[0].telefono);
                    } else {
                        $(".card-visible").addClass('d-none');
                    }

                }
            });
        }

        function listarHorario(){
            var datosEnviar = {
                'op'     : 'listarHorariosSedeDetalle',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#horariosdetalle").html(result);
                }
            });
        }

        $("#idsede").change(function() {
            let idsede = $(this).val();

            if(idsede == 0){
                listarDatos();
                $(".card-visible").addClass('d-none');
            } else {
                listarContactos($(this).val());
    
                $.ajax({
                    url: 'controllers/SaludOcupacional.controller.php',
                    type: 'GET',
                    data: {
                        op: 'cargarSaludOcupacionalSedes',
                        idsede: idsede
                    },
                    success: function(result) {
                        $("#lista-ocupacional").html(result);
                    }
                });
            }
        });

        SedesCargar();
        listarDatos();
    });
</script>