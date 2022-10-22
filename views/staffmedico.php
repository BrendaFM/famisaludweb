<div class="page-header">
    <div class="container">
        <h1 class="title">Nuestros Médicos</h1>
    </div>
</div>
<div class="container-data">
    <div class="container-page container-controls" data-aos="fade-up">
        <div class="row">
            <h4 class="title">Busca a tu Médico:</h4>
            
            <div class="col-md-4 form-group">
                <select id="idsede" class="form-select round-50 pd-15 text-gray">
                    <!-- Asíncrono -->
                </select>
            </div>
            <div class="col-md-5 form-group">
                <select id="idespecialidad" class="form-select round-50 pd-15 text-gray">
                    <!-- Asíncrono -->
                </select>
            </div>
            <div class="col-md-3 form-group">
                <button type="button" class=" form-control btn btn-famisalud round-50 pd-15" id="buscar">Buscar</button>
            </div>
        </div>
    </div>

    <div class="container-page content-header" data-aos="fade-up">
        <h4 class="title">Nuestros Profesionales:</h4>
    </div>
  
    <div class="container-page container-cards" id="cards" data-aos="fade-up">
     <!-- especialidades box -->
    </div>
</div>


<script>
    $(document).ready(function (){

    function Staff(){
        var datosEnviar = {
            'op'            : 'listarStaff'
        };
        $.ajax({
            url: 'controllers/Staff.controller.php',
            type: 'GET',
            data: datosEnviar,
            success: function(result){
                $("#cards").html(result);
            }
        });
    }

    function SedesCargar(){
        var datosEnviar = {
            'op'            : 'listarSede'
        };
        $.ajax({
            url: 'controllers/Sede.controller.php',
            type: 'GET',
            data: datosEnviar,
            success: function(result){
                $("#idsede").html(result);
            }
        });
    }

    $("#idsede").change(function (){
        var datosEnviar = {
            'op'          : 'listarStaffSede',
            'idsede'      : $(this).val()
        };

        $.ajax({
            url: 'controllers/Staff.controller.php',
            type: 'GET',
            data: datosEnviar,
            success: function(result){
                $("#cards").html(result);
            }
        });

    });
   
    $("#idsede").change(function (){
       var datosEnviar = {
           'op'            : 'cargarEspecialidades',
           'idsede'      : $(this).val()
        };
        $.ajax({
            url: 'controllers/Especialidad.controller.php',
            type: 'GET',
            data: datosEnviar,
            success: function(result){
                $("#idespecialidad").html(result);
            }
        });
    });

    function StaffBuscar(){
        let especialidad = $("#idespecialidad").val();
        let idsede = $("#idsede").val();

        var datosEnviar = {
            'op'                : 'StaffBuscar',
            'especialidad'      : especialidad,
            'idsede'            : idsede
        };

        $.ajax({
            url: 'controllers/Staff.controller.php',
            type: 'GET',
            data: datosEnviar,
            success: function(result){
                $("#cards").html(result);
            }
        });
    }
    
    Staff();
    SedesCargar();
    $("#buscar").click(StaffBuscar);
    });
</script>