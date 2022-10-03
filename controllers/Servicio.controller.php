<?php

    require_once '../models/Servicio.model.php';

    $servicio = new Servicio();

    if(isset($_GET['operacion'])){

        $operacion = $_GET['operacion'];

        //Listamos todos los servicios
        if($operacion == 'listarServicios'){
            
            $tabla = $servicio->listarServicios();

            // Enviar resultados a la vista
            if(count($tabla) == 0){
                echo "<h5>No encontramos registros disponibles</h5>";
            }
            else{
                // Variable para saber si tiene imagen o no
                $imagen = "";

                foreach($tabla as $registro){

                    //Si existe una imagen en la BD
                    if ($registro->fotografia == "" || $registro->fotografia == "null"){
                        //La imagen que se mostrara por defecto
                        $imagen = "MedicinaGeneral.jpg";
                    } 
                    else{
                        //Se muestra la imagen que esta almacenada en la BD
                        $imagen = $registro->fotografia;
                    }

                    echo "
                    <div class='box'>
                        <div class='box-header'>
                            <img src='../famisaludwebadmin/img/servicio/fotografia/$imagen'>
                        </div>
                        <div class='box-body'>
                            <h3 class='title text-center'>{$registro->servicio}</h3>
                            <p class='paragraph'>{$registro->infoservicio}</p>
                        </div>
                        <div class='box-footer'>
                            <button type='button' class='btn btn-show-more mostrar vermas text-gray' id-servicio='$registro->idservicio' nombre-servicio='$registro->servicio' data-bs-toggle='modal' data-bs-target='#modalServ'> 
                                Ver más <i class='fas fa-arrow-circle-right'></i>
                            </button> 
                        </div>
                    </div>
                    ";
                }
            }
        }

        //Listamos los servicio por sede
        if($operacion == 'onDataServicioSede'){

            $tabla = $servicio->onDataServicioSede(["idsede" => $_GET['idsede']]);

            // Enviar resultados a la vista
            if(count($tabla) == 0){
                echo "<h5>No encontramos registros disponibles</h5>";
            }
            else{
                // Variable para saber si tiene imagen o no
                $imagen = "";

                foreach($tabla as $registro){

                    //Si existe una imagen en la BD
                    if ($registro->fotografia == "" || $registro->fotografia == "null"){
                        //La imagen que se mostrara por defecto
                        $imagen = "MedicinaGeneral.jpg";
                    } 
                    else{
                        //Se muestra la imagen que esta almacenada en la BD
                        $imagen = $registro->fotografia;
                    }

                    echo "
                    <div class='box'>
                        <div class='box-header'>
                            <img src='../famisaludwebadmin/img/servicio/fotografia/$imagen'>
                        </div>
                        <div class='box-body'>
                            <h3 class='title text-center'>{$registro->servicio}</h3>
                            <p class='paragraph'>{$registro->infoservicio}</p>
                        </div>
                        <div class='box-footer'>
                            <button type='button' class='btn btn-show-more mostrar vermas text-gray' id-servicio='$registro->idservicio' nombre-servicio='$registro->servicio' data-bs-toggle='modal' data-bs-target='#modalServ'> 
                                Ver más <i class='fas fa-arrow-circle-right'></i>
                            </button> 
                        </div>
                    </div>
                    ";
                }
            }
        }

        //Listamos los servicio por sede
        if($operacion == 'buscarServicio'){

            $tabla = $servicio->buscarServicio(["servicio" => $_GET['servicio']]);

            // Enviar resultados a la vista
            if(count($tabla) == 0){
                echo "<h5>No encontramos registros disponibles</h5>";
            }
            else{
                // Variable para saber si tiene imagen o no
                $imagen = "";

                foreach($tabla as $registro){

                    //Si existe una imagen en la BD
                    if ($registro->fotografia == "" || $registro->fotografia == "null"){
                        //La imagen que se mostrara por defecto
                        $imagen = "MedicinaGeneral.jpg";
                    } 
                    else{
                        //Se muestra la imagen que esta almacenada en la BD
                        $imagen = $registro->fotografia;
                    }

                    echo "
                    <div class='box'>
                        <div class='box-header'>
                            <img src='../famisaludwebadmin/img/servicio/fotografia/$imagen'>
                        </div>
                        <div class='box-body'>
                            <h3 class='title text-center'>{$registro->servicio}</h3>
                            <p class='paragraph'>{$registro->infoservicio}</p>
                        </div>
                        <div class='box-footer'>
                            <button type='button' class='btn btn-show-more mostrar vermas text-gray' id-servicio='$registro->idservicio' nombre-servicio='$registro->servicio' data-bs-toggle='modal' data-bs-target='#modalServ'> 
                                Ver más <i class='fas fa-arrow-circle-right'></i>
                            </button> 
                        </div>
                    </div>
                    ";
                }
            }
        }

        if($operacion == 'listarServiciosSedeDetalle') {
            $datos = $servicio->listarServiciosSedeDetalle(["idsede" => $_GET['idsede']]);
            if(count($datos) == 0){
                echo "<option>No encontramos Servicio disponibles</opti>";
            }
            else{
    
                foreach($datos as $fila){
    
                    echo "
                            <div class='box_container'>
                                <div class=''>
                                    <img src='../famisaludwebadmin/img/servicio/icono/$fila->fotografia2' style='width: 100%;height: 5vh;'>
                                </div>
                                <div class='box_container_text'>
                                    <h5>$fila->servicio</h5>
                                    <p>$fila->dia: $fila->horainicio am - $fila->horafin pm</p>
                                    <p>Sabado: 7:00pm-1:00pm</p>
                                </div>
                            </div>
                            
    
                        ";
                            
                }
            }
        }

        if($operacion == 'listarDetalleServicio'){

            $datos = $servicio->listarDetalleServicio(["idservicio" => $_GET['idservicio']]);
            foreach($datos as $registro){

                echo "

                <div class='row'>
                    <div class='col-lg-6 mb-2 form-group d-flex flex-column justify-content-evenly lign-content-around'>
                        <h2 class='title'>{$registro->servicio}</h2>
                        <hr>
                        <p class='paragraph'>
                            {$registro->infoservicio}
                        </p>
                        <div class='content-hours'>
                            <h5>Horario de atención</h5>
                            <p class='direction text-center detespecialidad'><b>Atendemos de: </b>{$registro->dia} <b>- Desde las </b>{$registro->horainicio} de la mañana <b> hasta las </b>{$registro->horafin} de la noche</p>
                        </div>
                    </div>
                    <div class='col-lg-6 mb-2 form-group d-flex justify-content-center'>
                        <div class='content-image'>
                         <img src='../famisaludwebadmin/img/servicio/fotografia/$registro->fotografia' >                        
                        </div>
                    </div>
                </div>
                
            ";
            }

        }
    }

    if(isset($_POST['operacion'])){

        $operacion = $_POST['operacion'];

        if($operacion == 'registrarServicio'){

            //Paso1. Para guardar la imagen se necesita generar un nombre aleatorio
            $nombreImagen = "";
            //El nombre de la imagen es la fecha 
            $nombre = date('dmY') . date('Gis');
            $error = false;

            //Paso 2. Comprobamos si contiene imagen
            if(isset($_FILES['imgservicio'])){

                //generamos el nombre de la imagen
                $nombreImagen = $_FILES['imgservicio']['name'];
                $nombreImagen = explode(".", $nombreImagen);
                $nombreImagen = end($nombreImagen);
                $nombreImagen = $nombre.".".$nombreImagen;

                //Movemos
                if (!move_uploaded_file($_FILES['imgservicio']['tmp_name'], '../dist/img/' . $nombreImagen)){
                    $error = true;
                }
            }else{
                $nombreImagen = null;
            }

            $data = [
                "idsede"        => $_POST['idsede'],
                "idcategoria"   => $_POST['idcategoria'],
                "servicio"      => $_POST['servicio'],
                "infoservicio"  => $_POST['infoservicio'],
                "imgservicio"   => $nombreImagen
            ];

            if(!$error){
                //Enviamos los datos a la base de datos mediante el metodo registrar
                $servicio->registrarServicio($data);
            }else{
                echo "Ocurrio un error en el controller";
            }
        }//Fin de la operación
    }
?>