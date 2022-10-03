<?php

require_once '../core/model.master.php';

class Staff extends ModelMaster{

    public function listarStaff(){
        try{
            return parent::getRows("spu_staffmedico_listar_todos");
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }

    public function listarStaffSede(array $data){
        try{
        return parent::execProcedure($data, "spu_staffmedico_listar_sedes", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

    public function StaffBuscar(array $data){
        try{
        return parent::execProcedure($data, "spu_staffmedico_buscar", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }
}
?>