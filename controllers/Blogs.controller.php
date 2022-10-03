<?php

require_once '../models/Blog.php';

$blog = new Blog();

if (isset($_GET['op'])){

    if ($_GET['op'] == 'listarBlog') {
        $datos = $blog->listarblog();
        
        if(count($datos) == 0){
            echo "<h5>No encontramos registros disponibles :( </h5>";
        }
        else{
            foreach($datos as $fila){
                
                echo "
                <div class='box'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/blog/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h3 class='title text-center'>{$fila->tituloblog}</h3>
                        <p class='paragraph'>{$fila->infoblog}</p>
                    </div>
                    <div class='box-footer'>
                        <button type='button' class='btn mostrarblog btn-show-more vermas' id-blog='$fila->idblog' id-blog='$fila->idblog' data-bs-toggle='modal' data-bs-target='#modalBlog'> 
                            <b>Ver más</b> <i class='fas fa-arrow-circle-right'></i>
                        </button> 
                    </div>
                </div>
                ";
            }
        }
    }

    if ($_GET['op'] == 'listarBlogsSede'){
        $datos = $blog->listarBlogsSede(["idsede" => $_GET['idsede']]);
        
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
                        <img src='../famisaludwebadmin/img/blog/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h3 class='title text-center'>{$fila->tituloblog}</h3>
                        <p class='paragraph'>{$fila->infoblog}</p>
                    </div>
                    <div class='box-footer'>
                        <button type='button' class='btn mostrarblog btn-show-more vermas' id-blog='$fila->idblog' id-blog='$fila->idblog' data-bs-toggle='modal' data-bs-target='#modalBlog'> 
                            <b>Ver más</b> <i class='fas fa-arrow-circle-right'></i>
                        </button> 
                    </div>
                </div>
                ";
            }
        }
    }

    if($_GET['op'] == 'listarDetalleBlog'){

        $datos = $blog->listarDetalleBlog(["idblog" => $_GET['idblog']]);

        foreach($datos as $fila){

            echo "
            <div class='container-data-modal'>
                <div class='row'>
                    <div class='col-lg-6 mb-2 form-group d-flex flex-column justify-content-evenly lign-content-around'>
                        <h2 class='title'>{$fila->tituloblog}</h2>
                        <hr>
                        <p class='paragraph'>{$fila->infoblog}</p>
                    </div>
                    <div class='col-lg-6 mb-2 form-group d-flex justify-content-center'>
                        <div class='content-image'>
                        <img src='../famisaludwebadmin/img/blog/$fila->fotografia' class='imagen-responsivo-lg'>
                        </div>
                    </div>
                </div>
            </div>
            ";
        }

    }

}
?>