<?php

    require_once '../core/model.master.php';

    class Servicio extends ModelMaster{

        //Listar todos los servicios
        public function listarServicios(){
            try{
                return parent::getRows("spu_todosservicios_listar");
            }
            catch(Exception $e){
                die($e->getMessage());
            }
        }

        //Lista los servicios por sedes
        public function onDataServicioSede(array $idsede){
            try{
                return parent::execProcedure($idsede, "spu_servicios_listarPorSede", true);
            }
            catch(Exception $e){
                die($e->getMessage());
            }
        }

        //Buscador de servicios por nombre
        public function buscarServicio(array $servicio){
            try{
                return parent::execProcedure($servicio, "spu_servicios_buscador_nombre", true);
            }catch(Exception $e){
                die($e->getMessage());
            }
        }

        public function listarServiciosSedeDetalle(array $data){
            try{
            return parent::execProcedure($data, "spu_servicios_sede_detalle", true);
            }
            catch(Exception $error){
            die($error->getMessage());
            }
        }

        public function listarHorariosSedeDetalle(array $data){
            try{
            return parent::execProcedure($data, "spu_horarios_categorias_detalle", true);
            }
            catch(Exception $error){
            die($error->getMessage());
            }
        }

        public function listarDetalleServicio(array $idservicio){
            try{
            return parent::execProcedure($idservicio, "spu_horarioserviciodetalle_listar", true);
            }
            catch(Exception $error){
            die($error->getMessage());
            }
        }
    }
?>