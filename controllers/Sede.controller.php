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

                echo "
                    <h1 >Sede $fila->sede</h1>
                    ";
                        
            }
        }
    }
    if ($_GET['op'] == 'listarUbiLinkSede') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1>No encontramos registros disponibles</h1>";
        }
        else{
            foreach($datos as $fila){
                echo "
                    <h1 class='subtitle'><a href='$fila->ubicacion'><i class='fas fa-map-marked-alt' style='color:white'></i></a> Ubícanos</h1> 
                    ";
            }
        }
    }
    if ($_GET['op'] == 'listarUbiSede') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1>No encontramos registros disponibles</h1>";
        }
        else{
            foreach($datos as $fila){

                echo "
                    <h4 class='mt-2 mb-1'>$fila->direccion</h1>
                    ";
                        
            }
        }
    }
    if ($_GET['op'] == 'listarTelefono') {
        $datos = $sede->listarInfoSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            echo "<h1>No encontramos registros disponibles</h1>";
        }
        else{
            foreach($datos as $fila){

                echo "
                <h2 class='mt-3'>Contacto:</h2>
                <h4><i class='far fa-envelope'></i> $fila->correo</h4>
                <h4><a href='https://wa.me/$fila->telefono'><i class='fab fa-whatsapp' style='color:white'></i></a> $fila->telefono</h4>
                ";
                        
            }
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
                    <div class='carousel-item'>
                        <img src='../famisaludwebadmin/img/carouseldet/$fila->imagen' class='d-block w-100' style='width: 100%;  max-height: 38em; object-fit: fill; object-position: center center;'>
                    </div>
                    ";
                        
            }
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
                    <div class='mt-1'>
                        <p>$fila->titulohorario:</p>
                    </div>
                    <ul class='mb-3'>
                        <i class='fas fa-clock'></i> $fila->horario1.
                        <br>
                        <i class='fas fa-business-time'></i> $fila->horario2.
                    </ul>
                    ";
                        
            }
        }
    }
}
?>