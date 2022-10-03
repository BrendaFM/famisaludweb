<?php

    require_once '../core/model.master.php';

    class Categoria extends ModelMaster{
    
        //METODOS CRUD
    
        //Listar
        public function listarCategorias(){
            try{
                return parent::getRows("spu_categorias_listar");
            }
            catch(Exception $e){
                die($e->getMessage());
            }
        }
    }

?>