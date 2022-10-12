
<div class="page-header">
    <div class="container">
        <h1 class="title">Nuestros Servicios</h1>
    </div>
</div>

<div class="container-data">
    <div class="container-page container-controls" data-aos="fade-up">
        <div class="row">
                
            <h4 class="title">Busca tu Servicio:</h4>
            
            <div class="col-md-4 form-group">
                <select id="ListaSedes" class="form-control form-control-lg form-select sede-selector" >
                    <!-- Se cargarán de forma asincrona -->
                </select>
            </div>
            <div class="col-md-5 form-group">
              <input id="txtservicio" type="search" class="form-control form-control-lg sede-selector" placeholder="Servicio">                
            </div>

            <div class="col-md-3 form-group">
                <button  type="button" id="btnBuscarServicio" class="form-control btn-famisalud">Buscar</button>
            </div>
        </div>
    </div>
    
    <div class="container-page content-header" data-aos="fade-up">
        <h4 class="title">Resultados:</h4>
    </div>

    <div class="container-page container-cards" data-aos="fade-up" id="listar-servicios">
     <!-- especialidades box -->
    </div>
</div>

<div class="modal fade" id="modalServ" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title d-none" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-data-modal"   >
                    <div class="row" id="detalleservicio"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function (){

        //Lista todos los servicios
        function listarServicios(){
            $.ajax({
                url: 'controllers/Servicio.controller.php',
                type: 'GET',
                data: 'operacion=listarServicios',
                success: function (e){
                    $("#listar-servicios").html(e);
                }
            });
        }

        //Lista los servicios por sedes
        $("#ListaSedes").change(function (){

            var datos = {
                operacion   : 'onDataServicioSede',
                idsede      : $(this).val()
            };
            console.log($(this).val());

            $.ajax({
                url: 'controllers/Servicio.controller.php',
                type: 'GET',
                data: datos,
                success: function (e){
                    $("#listar-servicios").html(e);
                }
            });
        });

        //Cargar Sedes en desplegable
        function cargarSedes(){
            //Enviar datos por ajax, usando el metodo GET
            $.ajax({
                url:    'controllers/Sede.controller.php',
                type:   'GET',
                data:   'op=listarSede',
                success: function (e){
                    //Renderizar las etiquetas que vienen desde controllers
                    $("#ListaSedes").html(e); //html e Inyecta nuenvas etiquetas e 
                }
            }); // Fin ajax
        }

        //Buscar un servicio
        $("#btnBuscarServicio").click(function (){

            var datos = {
                operacion   : 'buscarServicio',
                servicio    : $("#txtservicio").val()
            };
            console.log($("#txtservicio").val());

            $.ajax({
                url: 'controllers/Servicio.controller.php',
                type: 'GET',
                data: datos,
                success: function (e){
                    $("#listar-servicios").html(e);
                }
            });
        });

        $("#listar-servicios").on("click", ".mostrar", function(){
            let idservicio = $(this).attr('id-servicio');

            $.ajax({
                    url:    'controllers/Servicio.controller.php',
                    type:   'GET',
                    data:   'operacion=listarDetalleServicio&idservicio=' + idservicio,
                    success: function(result){
                        $("#detalleservicio").html(result);                       
                    }
                });
        });

        //Ejecutar metodos al iniciar
        listarServicios();
        cargarSedes(); //Utilizado para filtrar

    });
</script>
