<div class="page-header">
    <div class="container">
        <h1 class="title">Especialidades</h1>
    </div>
</div>
<div class="container-data">
    <div class="container-page container-controls">
        <div class="row">
            <h4 class="title text-center d-none">Buscar especialidad:</h4>

            <div class="col-md-4"></div>
            <div class="col-md-4">
                <select class="form-select  selectespecialidad text-gray" id="idsede" >
                    <!--Se carga automaticamente-->
                </select>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>

    <div class="container-page content-header">
        <h4 class="title">Resultados:</h4>
    </div>
  
    <div class="container-page container-cards" id="cards-especialidad">
     <!-- especialidades box -->
    </div>
</div>

<div class="modal fade" id="modalEsp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title d-none" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-data-modal">
                    <div class="row" id="detalleespecialidad"></div>

                    <hr>
                    
                    <div class="container-sedes" id="sedesEspecialidades"></div>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {

        function listarEspecialidades() {
            var datosEnviar = {
                'op': 'listarEspecialidades'
            };

            $.ajax({
                url: 'controllers/Especialidad.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result) {
                    $("#cards-especialidad").html(result);
                }
            });
        }

        $("#idsede").change(function() {

            var datosEnviar = {
                'op': 'listarEspecialidadesPorSede',
                'idsede': $(this).val()
            };

            $.ajax({
                url: 'controllers/Especialidad.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result) {
                    if (datosEnviar == "") {
                        listarEspecialidades();
                    } else {
                        $("#cards-especialidad").html(result);
                    }
                }
            });

        });

        $("#cards-especialidad").on("click", ".mostrar", function() {
            let idespecialidad = $(this).attr('id-codigo');

            $.ajax({
                url: 'controllers/Especialidad.controller.php',
                type: 'GET',
                data: 'op=detalleespecialidad&idespecialidad=' + idespecialidad,
                success: function(result) {
                    $("#detalleespecialidad").html(result);
                }
            });
        });

        $("#cards-especialidad").on("click", ".mostrar", function() {
            let nombre = $(this).attr('nombre-codigo');

            $.ajax({
                url: 'controllers/Especialidad.controller.php',
                type: 'GET',
                data: 'op=sedesEspecialidades&especialidad=' + nombre,
                success: function(result) {
                    $("#sedesEspecialidades").html(result);
                }
            });
        });


        function filtrarSedes() {
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: 'op=listarSede',
                success: function(result) {
                    $("#idsede").html(result);
                }
            });
        }

        listarEspecialidades();
        filtrarSedes();

    });
</script>