<?php

require_once '../core/model.master.php';

class Carousel extends ModelMaster{

    public function listarCarousel(){
        try{
            return parent::getRows("spu_listar_carousel");
        } 
        catch (Exception $error){
            die($error->getMessage());
        }
    }
}

?>