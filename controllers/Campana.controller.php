<?php

require_once '../models/Campana.php';

$campana = new Campana();

if (isset($_GET['op'])){

    if ($_GET['op'] == 'listarCampanas') {
        $datos = $campana->listarcampanas();

        if(count($datos) == 0){
            echo "<h5>No encontramos registros disponibles :( </h5>";
        }
        else{
            foreach($datos as $fila){
                echo "
                <div class='box'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/campana/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h3 class='title text-center'>{$fila->titulocampana}</h3>
                        <p class='paragraph'>{$fila->infocampana}</p>
                    </div>
                    <div class='box-footer'>
                        <button type='button' class='btn mostrarcampana vermas btn-show-more' id-campana='$fila->idcampana' data-bs-toggle='modal' data-bs-target='#modalCampana'> 
                            <b>Ver más</b> <i class='fas fa-arrow-circle-right'></i>
                        </button>   
                    </div>
                </div>
                ";
            }
        }
    }

    if ($_GET['op'] == 'listarCampanasSede'){
        $datos = $campana->listarcampanasSede(["idsede" => $_GET['idsede']]);
        
        if(count($datos) == 0){
                echo "<h5 class='text-black'>No encontramos registros disponibles :( </h5>";
        }
        else{
            // Variable, utilizado para comprobar si contiene imagen o no
            $imagen = "";
    
            // Mostrar un registro, por cada iteración
            foreach($datos as $fila){

                echo "
                <div class='box'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/campana/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h3 class='title text-center'>{$fila->titulocampana}</h3>
                        <p class='paragraph'>{$fila->infocampana}</p>
                    </div>
                    <div class='box-footer'>
                        <button type='button' class='btn mostrarcampana vermas btn-show-more' id-campana='$fila->idcampana' data-bs-toggle='modal' data-bs-target='#modalCampana'> 
                            <b>Ver más</b> <i class='fas fa-arrow-circle-right'></i>
                        </button>   
                    </div>
                </div>
                ";
            }
        }
    }

    if($_GET['op'] == 'listarCampanasRandom'){
        $data = $campana->listarCampanasRandom();

        if($data){
            echo json_encode($data);
        }
    }

    if($_GET['op'] == 'listarDetalleCampana'){

        $datos = $campana->listarDetalleCampana(["idcampana" => $_GET['idcampana']]);

        foreach($datos as $fila){

            echo "
                <div class='row'>
                    <div class='col-lg-6 mb-2 form-group d-flex flex-column justify-content-evenly lign-content-around'>
                        <h2 class='title'>{$fila->titulocampana}</h2>
                        <hr>
                        <p class='paragraph'>{$fila->infocampana}</p>
                    </div>
                    <div class='col-lg-6 mb-2 form-group d-flex justify-content-center'>
                        <div class='content-image'>
                            <img src='../famisaludwebadmin/img/campana/$fila->fotografia'>
                        </div>
                    </div>
                </div>
            ";

        }

    }
}
?>