<?php

require_once '../models/Staff.php';

$staff = new Staff();

if (isset($_GET['op'])){

    if ($_GET['op'] == 'listarStaff') {
        $datos = $staff->listarStaff();
        if(count($datos) == 0){
            echo "<h5>No encontramos registros disponibles :( </h5>";
        }
        else{
            foreach($datos as $fila){
                $rne = "";
                if($fila->rne == ""){
                    $rne = "";
                }else{
                    $rne = "<strong>RNE:</strong> <span>{$fila->rne}</span>";
                }

                echo "
                <div class='box box-separate'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/staffmedico/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h5 class='subtitle text-center name'>{$fila->apellidos} {$fila->nombres}</h5>
                        <strong>ESPECIALIDAD:</strong> <span>{$fila->especialidad}</span> <br>
                        <strong>CMP:</strong> <span>{$fila->cmp}</span> <br>
                        <strong>RNE:</strong> <span>{$fila->rne}</span>
                    </div>
                </div>
                ";
            }
        }
    }

    if ($_GET['op'] == 'listarStaffSede') {
        $datos = $staff->listarStaffSede(["idsede" => $_GET['idsede']]);
        if(count($datos) == 0){
            $datos = $staff->listarStaff();
            if(count($datos) != 0){
                
                foreach($datos as $fila){
                    $rne = "";
                    if($fila->rne == ""){
                        $rne = "";
                    }else{
                        $rne = "<strong>RNE:</strong> <span>{$fila->rne}</span>";
                    }
                    echo "
                    <div class='box box-separate'>
                        <div class='box-header'>
                            <img src='../famisaludwebadmin/img/staffmedico/$fila->fotografia'>
                        </div>
                        <div class='box-body'>
                            <h5 class='subtitle text-center name'>{$fila->apellidos} {$fila->nombres}</h5>
                            <strong>ESPECIALIDAD:</strong> <span>{$fila->especialidad}</span> <br>
                            <strong>CMP:</strong> <span>{$fila->cmp}</span> <br>
                            {$rne}
                        </div>
                    </div>
                    ";
                            
                }
            }
        }
        else{
            $imagen = "";

            foreach($datos as $fila){
                $rne = "";
                if($fila->rne == ""){
                    $rne = "";
                }else{
                    $rne = "<p class='card-text' style='color: black;'><strong>RNE:</strong> $fila->rne</p>";
                }

                echo "
                <div class='box box-separate'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/staffmedico/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h5 class='subtitle text-center name'>{$fila->apellidos}{$fila->nombres}</h5>
                        <strong>ESPECIALIDAD:</strong> <span>{$fila->especialidad}</span> <br>
                        <strong>CMP:</strong> <span>{$fila->cmp}</span> <br>
                        <strong>RNE:</strong> <span>{$fila->rne}</span>
                    </div>
                </div>
                ";
                        
            }
        }
    }

    if ($_GET['op'] == 'StaffBuscar') {
        $datos = $staff->StaffBuscar(["especialidad" => $_GET['especialidad'],"idsede" => $_GET["idsede"]]);
        if(count($datos) == 0){
            echo "<h5>No encontramos Medicos en esta Especialidad</h5>";
        }
        else{

            foreach($datos as $fila){
                $rne = "";
                if($fila->rne == ""){
                    $rne = "";
                }else{
                    $rne = "<strong>RNE:</strong> <span>{$fila->rne}</span>";
                }

                echo "
                <div class='box box-separate'>
                    <div class='box-header'>
                        <img src='../famisaludwebadmin/img/staffmedico/$fila->fotografia'>
                    </div>
                    <div class='box-body'>
                        <h5 class='subtitle text-center name'>{$fila->apellidos} {$fila->nombres}</h5>
                        <strong>ESPECIALIDAD:</strong> <span>{$fila->especialidad}</span> <br>
                        <strong>CMP:</strong> <span>{$fila->cmp}</span> <br>
                        {$rne}
                    </div>
                </div>
                ";
                        
            }
        }
    }

}
?>