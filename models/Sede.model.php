<?php

require_once '../core/model.master.php';

class Sede extends ModelMaster{

    //Listar sede
    public function listarSede(){
        try{
            return parent::getRows("spu_sedes_listarActivo");
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }

    //Mostrar información de cada sede
    public function listarInfoSede(array $data){
        try{
        return parent::execProcedure($data, "spu_sedes_listar", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

    public function listarHorariosSedeDetalle(array $data){
        try{
        return parent::execProcedure($data, "spu_horariocategoria_listar_detalle", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

    public function carruseDetallePrincipal(array $data){
        try{
        return parent::execProcedure($data, "spu_cargar_carrusel_detalleprincipal", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

}
?>