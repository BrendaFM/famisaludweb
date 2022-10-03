<?php

    require_once '../models/Producto.model.php';

    $producto = new Producto();

    if (isset($_GET['op'])){

        if ($_GET['op'] == 'filtrarSedesConProductos') {
            $datos = $producto->filtrarSedesConProductos();
            if(count($datos) > 0){
                echo "
                        <option value=''>Seleccione</option>
                    ";
                // Mostrar un registro, por cada iteración
                foreach($datos as $fila){
                    echo "
                        <option value='$fila->idsede'>$fila->sede</option>
                    ";
                            
                }
            }
        }

        if ($_GET['op'] == 'listarProductoPorSede') {
            $datos = $producto->listarProductoPorSede(['idsede' => $_GET['idsede']]);
            if(count($datos) != 0){
                foreach($datos as $fila){
                    echo "
                        <div class='col-md-3  text-center card-farmacia' style='max-width: 300px; margin-bottom: 2em'>
                            <div class='card' >
                                <img src='../../famisaludwebadmin/img/farmacia/$fila->fotografia' class='card-img-top'  alt='...''>
                                <div class='card-body'>
                                    <h5 class='card-title'>$fila->producto</h5>
                                    <p class='card-text'>S/ $fila->precio</p>      
                                    <button type='button' class='btn btn-block text-primary vermas float-end text-gray mostrar' data-bs-toggle='modal' data-bs-target='#modalId'  id-codigo='$fila->idproducto' nombre-codigo='$fila->producto'> 
                                     <i class='far fa-eye'></i> Detalle
                                    </button>  
                                </div>
                            </div>
                        </div>
                    ";
                }
            }

            
        }

        


        if($_GET['op'] == "detalleproducto"){
            $datos = $producto->detalleproducto(["idproducto" => $_GET['idproducto']]);
    
            foreach($datos as $fila){
                echo "
                        <div class='row'>
                                <div class='col-md-6 text-center '>
                                    <br>
                                    <img src='../famisaludwebadmin/img/farmacia/$fila->fotografia' class='img-responsive-producto' alt='...'>
                                </div>
                                
                                <div class='col-md-6 detespecialidad text-black d-grid gap-2'>
                                    <br>
                                    <h2><b> $fila->producto </b></h2>
                                    <h3 class='detespecialidad'>S/ $fila->precio</h3>
                                    <hr>
                                    <h4> <b> Detalle: </b></h4>
                                    <p>$fila->detalle</p>
                                    <br>

                                    <a type='button' class ='btn btn-xl btn-block btn-success float-end size-font' href='https://wa.me/51956869696'> <i class='fab fa-whatsapp'> Cotiza tu receta</i></a>
                                    <br>
                                </div>
                        </div>
                ";
            }
        }
    }


?>