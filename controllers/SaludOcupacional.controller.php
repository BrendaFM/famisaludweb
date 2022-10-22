<?php

require_once '../models/SaludOcupacional.php';
$saludOcupacional = new SaludOcupacional();

if (isset($_GET['op'])){
    //Información de cada sede
    if ($_GET['op'] == 'listarSaludOcupacional') {
        $datos = $saludOcupacional->listarSaludOcupacional();
        if(count($datos) == 0){
            echo "<h1>No encontramos registros disponibles</h1>";
        }
        else{

            foreach($datos as $fila){
                    //DALE DISEÑO
                echo "
                <div class='box-public' data-aos='fade-right'>
                    <div class='left'>
                        <img src='../famisaludwebadmin/img/saludocupacional/$fila->foto'>
                    </div>
                    <div class='right'>
                        <h4 class='fw-bold'>{$fila->titulo}</h4>
                        <p>{$fila->descripcion}</p>
                    </div>                
                </div>
                ";
                        
            }
        }
    }
    if ($_GET['op'] == 'cargarSaludOcupacionalSedes') {
        $datos = $saludOcupacional->cargarSaludOcupacionalSedes(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h5>No encontramos registros disponibles</h5>";
        }
        else{

            foreach($datos as $fila){

                    echo "
                <div class='box-public' data-aos='fade-right'>
                    <div class='left'>
                        <img src='../famisaludwebadmin/img/saludocupacional/$fila->foto'>
                    </div>
                    <div class='right'>
                        <h4 class='fw-bold'>{$fila->titulo}</h4>
                        <p>{$fila->descripcion}</p>
                    </div>                
                </div>
                ";
                        
            }
        }
    }
    if ($_GET['op'] == 'detalleSaludOcupacional') {
        $datos = $saludOcupacional->detalleSaludOcupacional(["idsaludocupacional" => $_GET['idsaludocupacional']]);
        if(count($datos) == 0){
            echo "<h1>No encontramos registros disponibles</h1>";
        }
        else{

            foreach($datos as $fila){
                    //DALE DISEÑO
                        
                echo "

                    <div class='row'>
                        <div class='col-lg-6 mb-2 form-group d-flex flex-column justify-content-evenly lign-content-around'>
                            <h2 class='title'>{$fila->titulo}</h2>
                            <hr>
                            <p class='paragraph'>
                                {$fila->descripcion}
                            </p>
                        </div>
                        <div class='col-lg-6 mb-2 form-group d-flex justify-content-center'>
                            <div class='content-image'>           
                            <img src='../famisaludwebadmin/img/saludocupacional/$fila->foto'>            
                            </div>
                        </div>
                    </div>
                    
                ";
            }
        }
    }
}
?>