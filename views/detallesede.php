<div class="page-header">
    <div class="container">
        <h1 class="title" id="titulo">Sede Lima</h1>
    </div>
</div>
<div class="container-data detail-campus">

    <div class="content-location">
        <img src="assets/img/sedes/sede_pisco.jpg" class="bg-image" id="imagen-fondo">
        
        <div class="content">
            <div class="content-text">
                <span class="subtitle">CONTÁCTANOS</span>
                <div class="row">
                    <div class="col-lg-6">
                        <a href="#" class="email" id="email"><i class="far fa-envelope"></i> Email</a>

                    </div>
                    <div class="col-lg-6">
                        <a href="#" class="whatsapp" id="whatsapp"><i class="fab fa-whatsapp"></i> Whatsapp</a>

                    </div>
                </div>
                
                <span class="subtitle">UBÍCANOS</span>
                <div class="">
                    <h2 class="direction" id="ubicacion">Av. Inca Garcilaso de la Vega</h2>    
                    <a href="#" class="link-gps float-end" id="linksede"><i class="fas fa-map-marker-alt"></i> ¿Cómo llegar?</a>
                </div>
            </div>
        </div>
    </div>
    
    <hr>

    <div class="content-hours">
        <div class="content-image">
            <img src="img/docs.jpg" class="bg-image">
        </div>

        <div class="content-text">
            <h3 class="title">¿Conces nuestros Horarios de atención?</h3>
            <div id="horariosdetalle">

            </div>
        </div>
    </div>

    <hr>
    
    <div class="content-carousel">
        <div id="carouselsede" class="carousel slide" data-bs-touch="false">
            <div class="carousel-inner">
                <div id="carruselprincipal">

                </div>
                <div id="carruselsecundario">

                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselsede" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselsede" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>
    </div>

    <div class="content-services">
        <h3 class="title">Servicios:</h3>
        <div class="content" id="servicios">
            <!-- <div class="box-service">
                <div class="box-icon">
                    <img src="../../famisaludwebadmin/img/servicio/icono/2022092211.jpg" alt="">
                </div>
                <div class="box-text">
                    <h5 class="title">prueba</h5>
                    <span>Lunes a Sabados de 7.00</span>
                    <span>Lunes a Sabados de 7.00</span>
                </div>
            </div> -->

            <!-- Asíncrono -->

        </div>
    </div>
</div>

<script>
    $(document).ready(function(){        
        var idsede = localStorage.getItem('idsede');

        function listarTituloSede(){
            var datosEnviar = {
                'op'            : 'listarInfoSede',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#titulo").html(result);
                }
            });
        }

        function listarUbiLinkSede(){
            var datosEnviar = {
                'op'            : 'listarUbiLinkSede',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#linksede").attr("href", result);
                }
            });
        }

        function fondoSede(){
            var datosEnviar = {
                'op'            : 'fondo',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    var data = JSON.parse(result);

                    $("#imagen-fondo").attr("src", "../famisaludwebadmin/img/sede/" + data[0].fotografia);
                }
            });
        }

        function listarUbiSede(){
            var datosEnviar = {
                'op'            : 'listarUbiSede',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#ubicacion").html(result);
                }
            });
        }

        function listarContactos(){
            var datosEnviar = {
                'op'            : 'listarTelefono',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){

                    var data = JSON.parse(result);

                    $("#email").attr("href", data[0].correo);
                    $("#whatsapp").attr("href", "https://wa.me/" + data[0].telefono);
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

        function CarruselPrincipal(){
            var datosEnviar = {
                'op'            : 'carruseDetallePrincipal',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#carruselprincipal").html(result);
                }
            });
        }
        function CarruselSecundario(){
            var datosEnviar = {
                'op'            : 'carruseDetalleSecundario',
                'idsede'        : idsede
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#carruselsecundario").html(result);
                }
            });
        }

        function cargarServicios(){
            var datosEnviar = {
                    'operacion'            : 'listarServiciosSedeDetalle',
                    'idsede'        : idsede
                    };
                $.ajax({
                    url: 'controllers/Servicio.controller.php',
                    type: 'GET',
                    data: datosEnviar,
                    success: function(result){
                        $("#servicios").html(result);
                    }
                });
        }

        function QuitarIdSede(){
            localStorage.removeItem("idsede");
        }

        listarTituloSede();
        listarUbiLinkSede();
        listarUbiSede();
        listarContactos();
        listarHorario();
        fondoSede();
        cargarServicios();
        CarruselPrincipal();
        CarruselSecundario();
        
    });
</script>