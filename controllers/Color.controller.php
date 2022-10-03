<?php


if(isset($_GET['op'])){

    // Operación
    if($_GET['op'] == 'bgCardHover'){
        $data = [
            ["bg" => "#E2F4F7"]
        ];

        if($data){
            echo json_encode($data);
        }
    }
}


?>