<?php

require_once '../core/model.master.php';

class Persona extends ModelMaster{
    public function listarPersonas(){
        try{
            return parent::getRows("spu_personas_listar");
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }
}
?>