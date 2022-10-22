<?php

require_once '../models/Especialidad.model.php';

$especialidad = new Especialidad();

if (isset($_GET['op'])){

    if ($_GET['op'] == 'cargarEspecialidades') {
        $datos = $especialidad->cargarEspecialidades(['idsede' => $_GET['idsede']]);
        if(count($datos) == 0){
            echo '<option>No encontramos Especialidades disponibles</option>';
        }
        else{
            foreach($datos as $fila){
                echo "
                    <option value='$fila->especialidad'>$fila->especialidad</option>
                ";    
            }

        }
    }

    if ($_GET['op'] == 'listarEspecialidadesSedeDetalle') {
        $datos = $especialidad->cargarEspecialidades(['idsede' => $_GET['idsede']]);
        if(count($datos) == 0){
            echo '<option>No encontramos registros disponibles</option>';
        }
        else{

            foreach($datos as $fila){

                echo "
                        <div class='card col-md-3' style='margin-bottom: 1.5em;  margin-left: 2em; margin-right: 4em;' >
                            <div class='card-body'>
                                <p>
                                    <img src='../famisaludwebadmin/img/especialidad/icono/$fila->fotografia2' class='content-message-services img-fluid rounded-start' alt='...' style='width: 8vh;height: 8vh; margin-right:1em'>
                                    $fila->especialidad
                                </p>
                            </div>
                        </div>

                        <!--
                        <div class='card col-mb-3' style='max-width: 540px;'>
                            <div class='row g-0'>
                                <div class='col-md-12'>
                                <img src='../famisaludwebadmin/img/especialidad/icono/$fila->fotografia2' class='img-fluid rounded-start' alt='...'>
                                </div>
                                <div class='col-md-12'>
                                <div class='card-body'>
                                    <p class='card-text'>$fila->especialidad</p>
                                </div>
                                </div>
                            </div>
                        </div> 
                        -->
                        
                    ";                   
                    
            }
        }
    }
       

    // Anderson 
    if ($_GET['op'] == 'listarEspecialidades') {
        $datos = $especialidad->listarEspecialidades();
        if(count($datos) != 0){
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = '';

            // Mostrar un registro, por cada iteración
            foreach($datos as $fila){


                echo "
                <div class='box'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/especialidad/fotografia/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h5 class='subtitle text-center'>ESPECIALIDAD</h5>
                        <h3 class='title text-center'>{$fila->especialidad}</h3>
                    </div>
                    <div class='box-footer'>
                        <button type='button' class='btn btn-show-more mostrar vermas' id-codigo='$fila->idespecialidad' nombre-codigo='$fila->especialidad' data-bs-toggle='modal' data-bs-target='#modalEsp'> 
                            <span>Ver más</span> <i class='fas fa-arrow-circle-right'></i>
                        </button> 
                    </div>
                </div>
                ";
                        
            }
        }
    }

    if ($_GET['op'] == 'listarEspecialidadesPorSede') {
        $datos = $especialidad->listarEspecialidadesPorSede(['idsede' => $_GET['idsede']]);
        
        if(count($datos) == 0){
            echo 'No hay especialidades disponible en esta sede';
        }
        else{
            // Mostrar un registro, por cada iteración
            foreach($datos as $fila){
              
                echo "
                <div class='box'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/especialidad/fotografia/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h5 class='subtitle text-center'>ESPECIALIDAD</h5>
                        <h3 class='title text-center'>{$fila->especialidad}</h3>
                    </div>
                    <div class='box-footer'>
                        <button type='button' class='btn btn-show-more mostrar vermas' id-codigo='$fila->idespecialidad' nombre-codigo='$fila->especialidad' data-bs-toggle='modal' data-bs-target='#modalEsp'> 
                            <span>Ver más</span> <i class='fas fa-arrow-circle-right'></i>
                        </button> 
                    </div>
                </div>
                ";
            }
        }
    }

    // Aleatorio
    if ($_GET['op'] == 'listarEspecialidadesAleatorio') {
        $datos = $especialidad->listarEspecialidadesAleatorio();
        
        if(count($datos) == 0){
            echo 'No hay especialidades disponible en esta sede';
        }
        else{
            // Mostrar un registro, por cada iteración
            foreach($datos as $fila){
              
                echo "
                <div class='box'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/especialidad/fotografia/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h5 class='subtitle text-center'>ESPECIALIDAD</h5>
                        <h3 class='title text-center'>{$fila->especialidad}</h3>
                    </div>
                    <div class='box-footer'>
                        <button type='button' class='btn btn-show-more mostrar vermas' id-codigo='$fila->idespecialidad' nombre-codigo='$fila->especialidad' data-bs-toggle='modal' data-bs-target='#modalEsp'> 
                            <span>Ver más</span> <i class='fas fa-arrow-circle-right'></i>
                        </button> 
                    </div>
                </div>
                ";
            }
        }
    }

    if($_GET['op'] == 'detalleespecialidad'){
        $datos = $especialidad->detalleespecialidad(['idespecialidad' => $_GET['idespecialidad']]);

        foreach($datos as $fila){
            $horariolv = '';
            $horariosd = '';
            $titulo = '';

            if($fila->horario == '' && $fila->horario2 == ''){
                $titulo = '';
            }else{
                $titulo = "<h5 class='text-center text-black '><b>Horario de atención:</b></h5>";
            }

            if($fila->horario == ''){
                $horariolv = "<p class='text-center'>Lunes a Viernes: No hay atención en esta especialidad</p>";
            }else{
                $horariolv = "<p class='text-center'>$fila->horario</p>";
            }

            if($fila->horario2 == ''){
                $horariosd = "<p class='text-center '>Sábados: No hay atención en esta especialidad</p>";
            }else{
                $horariosd = "<p class='text-center '>$fila->horario2</p>";
            }

            
            echo "
       
                <div class='col-lg-6 mb-2 form-group d-flex flex-column justify-content-evenly lign-content-around'>
                    <h2 class='title'>{$fila->especialidad}</h2>
                    <hr>
                    <p class='paragraph'>
                        {$fila->informacion}
                    </p>
                    <div class='content-hours'>
                        {$titulo}
                        {$horariolv}
                        {$horariosd}
                    </div>
                </div>
                <div class='col-lg-6 mb-2 form-group d-flex justify-content-center'>
                    <div class='content-image'>
                        <img src='../famisaludwebadmin/img/especialidad/fotografia/$fila->fotografia'>
                    </div>
                </div>
            ";
        }
    }

    if($_GET['op'] == 'sedesEspecialidades'){
        $datos = $especialidad->sedesEspecialidades(['especialidad' => $_GET['especialidad']]);

        foreach($datos as $fila){
            
            echo "
            
            <div class='card body'>
                <h5 class='subtitle'>Sede</h5>
                <h4 class='campus'>{$fila->sede}</h4>
                <p class='direction'>{$fila->direccion}</p>
            </div>
            ";

        }
    }

    if ($_GET['op'] == 'filtrarSedes') {
        $datos = $especialidad->filtrarSedes();
        if(count($datos) > 0){
            // Mostrar un registro, por cada iteración
            foreach($datos as $fila){
                echo "
                    <option value='$fila->idsede'>$fila->sede</option>
                ";
                        
            }
        }
    }
}
?>