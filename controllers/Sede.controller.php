<?php

require_once '../models/Sede.model.php';

$sede = new Sede();

if (isset($_GET['op'])){

    
    //Información de cada sede
    if ($_GET['op'] == 'listarSede') {
        $datos = $sede->listarSede();
        if(count($datos) == 0){
            echo "<h1>No encontramos registros disponibles</h1>";
        }
        else{
            echo "
                    <option value='0'>Sedes</option>
                    ";
            foreach($datos as $fila){

                echo "
                    <option value='$fila->idsede'>$fila->sede</option>
                    ";
                        
            }
        }
    }
    if($_GET['op'] == 'listSedes'){
        $datos = $sede->listarSede();
        
        if($datos){
            echo json_encode($datos);
        }
    }
    
    if ($_GET['op'] == 'listarInfoSede') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1>No encontramos registros disponibles</h1>";
        }
        else{
            foreach($datos as $fila){

                echo "Sede " . $fila->sede;                        
            }
        }
    }
    if ($_GET['op'] == 'listarUbiLinkSede') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h5>No encontramos registros disponibles</h5>";
        }
        else{
            foreach($datos as $fila){
                echo $fila->ubicacion;
            }
        }
    }
    if ($_GET['op'] == 'listarUbiSede') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h5>No encontramos registros disponibles</h5>";
        }
        else{
            foreach($datos as $fila){

                echo $fila->direccion;
                        
            }
        }
    }
    if ($_GET['op'] == 'listarTelefono') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) > 0){
            echo json_encode($datos);
        }
    }

    if ($_GET['op'] == 'listarHorariosSedeDetalle') {
        $datos = $sede->listarHorariosSedeDetalle(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1></h1>";
        }
        else{
            foreach($datos as $fila){
                        
                echo "
                    <span class='subtitle'>{$fila->titulohorario}:</span>
                    <div class='content'>
                        <span><i class='fas fa-stopwatch'></i>  {$fila->horario1}</span>
                        <span><i class='fas fa-business-time'></i> {$fila->horario2}</span>
                    </div>
                ";
            }
        }
    }

    if ($_GET['op'] == 'fondo') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1></h1>";
        }
        else{
            echo json_encode($datos);
        }
    }
    if ($_GET['op'] == 'carruseDetallePrincipal') {
        $datos = $sede->carruseDetallePrincipal(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1></h1>";
        }
        else{
            foreach($datos as $fila){

                echo "
                    <div class='carousel-item active'>
                        <img src='../famisaludwebadmin/img/carouseldet/$fila->imagen'>
                    </div>
                    ";
                        
            }
        }
    }
    if ($_GET['op'] == 'carruseDetalleSecundario') {
        $datos = $sede->carruseDetalleSecundario(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1></h1>";
        }
        else{
            foreach($datos as $fila){

                echo "
                    <div class='carousel-item'>
                        <img src='../famisaludwebadmin/img/carouseldet/$fila->imagen' >
                    </div>
                    ";
                        
            }
        }
    }
}
?>