<?php

require_once '../core/model.master.php';

class Campana extends ModelMaster{

    public function listarcampanas(){
        try{
            return parent::getRows("spu_campanas_listar_todo");
        }
        catch (Exception $error){
            die($error->getMessage());
        }

    }

    public function listarCampanasRandom(){
        try{
            return parent::getRows("spu_campanas_listar_random");
        }
        catch (Exception $error){
            die($error->getMessage());
        }

    }

    public function listarCampanasSede(array $data){
        try{
            return parent::execProcedure($data, "spu_campanas_sedes_listar", true);
        }
        catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function listarDetalleCampana(array $idcampana){
        try{
            return parent::execProcedure($idcampana, "spu_campanas_detalle_listar", true);
        }
        catch(Exception $error){
            die($error->getMessage());
        }
    }

}

?>