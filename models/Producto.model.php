<?php

require_once '../core/model.master.php';

    class Producto extends ModelMaster{
        public function listarProductoPorSede(array $datos){
            try{
                return parent::execProcedure($datos, "spu_productos_listarPorSede", true);
            } 
            catch (Exception $error){
                die($error->getMessage());
            }
        }

        public function filtrarSedesConProductos(){
            try{
                return parent::getRows("spu_sedesProductos_productos");
            } 
            catch (Exception $error){
                die($error->getMessage());
            }
        }

        public function detalleproducto(array $data){
            try{
                return parent::execProcedure($data, "spu_detalleproducto_detalle", true);
            }catch(Exception $error){
                die($error->getMessage());
            }
        }

    }
?>