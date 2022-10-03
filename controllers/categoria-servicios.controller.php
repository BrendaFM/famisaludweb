<?php

// Integrando al modelo y la entidad BD
require_once '../models/categoria-servicios.models.php';

//Instanciamos el modelo
$categoria = new Categoria();

if (isset($_GET['operacion'])){

    //Almacenamos la variable operación en una variable
    $operacion = $_GET['operacion'];

    //Lista departamentos
    if ($operacion == 'listarCategorias'){

        // Alamcenar en un objeto
        $tabla = $categoria->listarCategorias();

        if (count($tabla) > 0){
            //Contiene datos que podemos mostrar
            echo "<option value=''>Categoria</option>";
            foreach($tabla as $registro){
                echo "<option value='{$registro->idcategoria}'>{$registro->categoria}</option>";
            }
        }else{
            echo "<option value=''>No se encontraron datos</option>";
        }
    }
}
?>