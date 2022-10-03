<?php

require_once '../models/Persona.php';

$persona = new Persona();

if (isset($_GET['op'])){

    if ($_GET['op'] == 'listarPersonas') {
        $datos = $persona->listarPersonas();
        echo json_encode($datos);
    }
}
?>