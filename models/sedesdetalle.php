<style>
    .contenido_sedesdetalle{
        width:100% !important;
        overflow: hidden !important;
        margin: auto;
    }
    .servicios__box {
        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
        -ms-flex-direction: row;
        flex-direction: row;
        flex-wrap: wrap;
        -webkit-box-pack: start;
        justify-content: flex-start;
        margin-right: 6em;
        margin-left: 6em;
    }
    .box_container {
        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
        flex-direction: row;
        flex-wrap: wrap;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        width: 33%;
        padding: 11px 0px;
        border-top: 1px solid #f2f2f2;
    }
    .servicios__box h5 {
        margin-top: 0;
        margin-bottom: 0rem;
        font-size: 1.15rem;
        font-weight: bold;
    }
    .sede-informacion{
        width: 100%;
        height: 30em !important;
        /*background-image: url("img/degradado.jpg");*/
        background-image: linear-gradient(rgba(56,170,231,0.4), rgba(56,170,231,0.4)), url("img/degradado.jpg");
        background-position: center center;
        opacity: 1;
        display: flex;
        flex-flow: row wrap;
        justify-content: end;
        align-items: center;
        padding: 25px;
        position: relative;
    }
    .sede-informacion .content-text{
        color:white;
        font-family: Open Sans;
    }
    .seccion_especialidades .row{
        --bs-gutter-x: 0rem;
        --bs-gutter-a: -8rem;
        --bs-gutter-y: 0;
        
        display: flex;
        flex-wrap: wrap;
        margin-top: calc(-1 * var(--bs-gutter-y));
        margin-right: calc(-.5 * var(--bs-gutter-a));
        margin-left: calc(-.5 * var(--bs-gutter-x));
    }
    .seccion_especialidades .row .col-md-3 {
        flex: 0 0 auto;
        width: 25%;
    }
    @media (max-width: 668px) {
        .sede-informacion{
            width: 100%;
            height: 20em !important;
            /*background-image: url("img/degradado.jpg");*/
            background-image: linear-gradient(rgba(255,255,255,0.3), rgba(255,255,255,0.3)), url("img/degradado.jpg");
            background-position: center center;
            opacity: 1;
            display: flex;
            flex-flow: row wrap;
            justify-content: end;
            align-items: center;
            padding: 25px;
            position: relative;
        }
        .box_container {
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            flex-direction: row;
            flex-wrap: wrap;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
            width: 50%;
            padding: 11px 0px;
            border-top: 1px solid #f2f2f2;
            box-sizing: content-box;
        }
        .servicios__box {
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-direction: row;
            flex-direction: row;
            flex-wrap: wrap;
            -webkit-box-pack: start;
            justify-content: flex-start;
            margin-right: 1em;
            margin-left: 1em;
        }
        .servicios__box h5 {
            margin-top: 0;
            margin-bottom: 0rem;
            font-size: 0.8rem;
            font-weight: bold;
        }

        .seccion_especialidades .row{
            --bs-gutter-x: 0rem;
            --bs-gutter-a: 0rem;
            --bs-gutter-y: 0;
            
            display: flex;
            flex-wrap: wrap;
            margin-top: calc(-1 * var(--bs-gutter-y));
            margin-right: calc(-.5 * var(--bs-gutter-a));
            margin-left: calc(-.5 * var(--bs-gutter-x));
        }
        .seccion_especialidades .row .col-md-3 {
        flex: 0 0 auto;
        width: 100%;
        }
    }
    .box_container_text {
        width: 60%;
        padding-left: 20px;
    }
    .servicios__img {
        width: 50%;
    }
    .servicios__background {
        width: 100%;
        height: 100%;
        background-size: cover;
        background-position: top center;
        background-repeat: no-repeat;
    }
    .carousel-caption {
        position: absolute; 
        right: 15%;
        top: 2em; /* Cambiar bottom por top y los píxeles que necesites */
        left: 15%;
        z-index: 10;
        padding-top: 20px;
        padding-bottom: 20px;
        color: #fff;
        text-align: center;
    }
    .sededetalle {
        position: relative; 
        right: 15%;
        top: 0em; /* Cambiar bottom por top y los píxeles que necesites */
        left: 15%;
        z-index: 10;
        padding-top: 10em;
        padding-bottom: 20px;
        color: #fff;
        text-align: right;
    }
    .servicios__box p {
        margin-top: 0;
        margin-bottom: 0rem;
        font-size: 0.7rem;
    }
    .servicios__box__container_2 {
        display: flex;
        -webkit-box-orient: horizontal;
        -webkit-box-direction: normal;
        flex-direction: row;
        flex-wrap: wrap;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        width: 50%;
    }
    .servicios__box__text_2 {
        width: 60%;
        padding-left: 2px;
    }
    #especialidades #img_img{
        text-align: end;
    }
    .especialidades p{  
        /* margin-top: 0; */
        /* margin-bottom: 1rem; */
        margin-block-start: 0em !important;
        margin-block-end: 0em;
    }
    .especialidades .card-body{
        padding:0px;
    }
    .card-body {
        flex: 1 1 auto;
        --bs-card-spacer-y: 0rem;
        --bs-card-spacer-x: 0rem;
        padding: var(--bs-card-spacer-y) var(--bs-card-spacer-x);
    }
    .card-body p{
        margin-top: 0;
        margin-bottom: 1rem;
        margin-block-start: 0em;
        margin-block-end: 0em;
    }
    .seccion_especialidades{
        margin-right: 4em;
        margin-left: 4em;
    }
    #titulo{
        font-family: Open Sans;
    }

</style>

<div class="contenido_sedesdetalle">
    <div class="page-header">
        <div class="container">
            <div class="row">

                <div class="col-md-6">
                </div>
                <div class="col-md-6">                
                    <h1 class="title text-center" id="titulo"></h1>
                </div>
            </div>
        </div>
    </div>
    <!-- Datos -->
    <div>
        <!-- <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6">
                
                <div style="position: absolute; color: #fff; margin-top:1em;">
                    <h1 class="mt-5">Ubícanos</h1> 
                    <div id="ubicacion"></div>   
                    <h3 class="mt-4 " href="http://maps.google.com/maps?q=loc:-12.058292, -77.038076" target="_blank"><i class="fas fa-map-marked-alt"></i> ¿Cómo llegar?</h3>
                    <h2 class="mt-4 ">Número  Teléfonico </h2>
                    <div id="telefono">                   

                    </div>
                </div>
            </div>
        </div> -->
        <div class="sede-informacion">
            <div class="col-md-6">
            </div>
            <div class="col-md-6">
                <div class="container-top">
                    <div class="content-text">
                        <div id="linksede"></div>
                        <div id="ubicacion" class="mb-4"></div>
                        <div id="telefono"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- <img src="img/degradado.jpg" alt="Los Angeles" class="d-block w-100">

        </img>   --> 
    </div>
    <hr>
    <!-- Horario -->
    <div class="">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-4">
                <img src='img/docs.jpg' class='' style='border-radius: 10px;width: 100%;max-height: 22em; object-fit: fill; object-position: center center;'>
    
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-5" style="border: 1px solid #000; border-radius: 10px;">
                <div class="mt-4 mb-4">
                    <h4 style="font-weight: bold; color: #055bb7;">¿Conoces nuestros horarios de atención?</h4>
                </div>
                <ul id="horariosdetalle"> <!-- style="border: 1px solid black;" -->
                </ul>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>
    <hr>
    <!-- Carrusel -->
    <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false">
      <div class="carousel-inner">
        <div class='carousel-item active'>
            <img src='img/primeraimagen.jpg' class='d-block w-100' style='width: 100%;max-height: 38em; object-fit: fill; object-position: center center;'>
        </div>
        <div id="carruselprincipal">

        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
    <hr>
    <!-- Servicios -->
    <div class="servicios__content">
        <div class="servicios__text">
            <div class="servicios__text__title">
                <h3 style="font-weight: bold; color: #055bb7; padding-top: 1em; padding-left: 3em; padding-bottom: 1em;">Servicios:</h3>
            </div>
            <div class="servicios__text__content">
                <div class="servicios__box" id="servicios">
                </div>
            </div>
        </div>
    </div>
    <hr>
    <!-- Especialidades -->
    <!--<div class="seccion_especialidades" >
        <h3 class="mb-5 mt-5 text-center">Especialidades Diponibles</h3>
        <div class="row especialidadescard"   id="especialidades">
        
        </div>
        
    </div>-->
</div>

<script>
    $(document).ready(function (){

        var cat = localStorage.getItem('idsede');

        function listarTituloSede(){
            var datosEnviar = {
                'op'            : 'listarInfoSede',
                'idsede'        : cat
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
                'idsede'        : cat
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#linksede").html(result);
                }
            });
        }
        function listarUbiSede(){
            var datosEnviar = {
                'op'            : 'listarUbiSede',
                'idsede'        : cat
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
        function listarTelefono(){
            var datosEnviar = {
                'op'            : 'listarTelefono',
                'idsede'        : cat
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#telefono").html(result);
                }
            });
        }
        function listarHorario(){
            var datosEnviar = {
                'op'     : 'listarHorariosSedeDetalle',
                'idsede'        : cat
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
                'idsede'        : cat
                };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#carruselprincipal").html(result);
                    console.log(result);
                }
            });
        }
        function CargarServicios(){
            var datosEnviar = {
                    'operacion'            : 'listarServiciosSedeDetalle',
                    'idsede'        : cat
                    };
                $.ajax({
                    url: 'controllers/Servicio.controller.php',
                    type: 'GET',
                    data: datosEnviar,
                    success: function(result){
                        $("#servicios").html(result);
                        console.log(cat)
                    }
                });
        }
        function CargarEspecialidades(){
            var datosEnviar = {
                'op'            : 'listarEspecialidadesSedeDetalle',
                'idsede'        : cat
                };
            $.ajax({
                url: 'controllers/Especialidad.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result){
                    $("#especialidades").html(result);
                }
            });
        }

        listarTituloSede();
        listarUbiLinkSede();
        listarUbiSede();
        listarTelefono();
        listarHorario();
        CarruselPrincipal();
        CargarServicios();
        CargarEspecialidades();


        function QuitarIdSede(){
            localStorage.removeItem("idsede");
        }
        
        //window.beforeunload  = QuitarIdSede();

    });
</script>