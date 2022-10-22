<?php

require_once '../core/model.master.php';

class SaludOcupacional extends ModelMaster{

    public function listarSaludOcupacional(){
        try{
            return parent::getRows("spu_saludocupacional_listar_todos");
        }
        catch (Exception $error){
            die($error->getMessage());
        }

    }

    public function cargarSaludOcupacionalSedes(array $data){
        try{
            return parent::execProcedure($data, "spu_saludocupacional_cargar", true);
        }
        catch (Exception $error){
            die($error->getMessage());
        }

    }

    public function detalleSaludOcupacional(array $data){
        try{
            return parent::execProcedure($data, "spu_saludocupacional_cargardetalle", true);
        }
        catch(Exception $error){
            die($error->getMessage());
        }
    }

}

?>