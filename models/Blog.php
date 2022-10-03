<?php

require_once '../core/model.master.php';

class Blog extends ModelMaster{

    public function listarblog(){
        try{
            return parent::getRows("spu_blogs_listar_todo");
        }
        catch (Exception $error){
            die($error->getMessage());
        }

    }

    public function listarBlogsSede(array $data){
        try{
            return parent::execProcedure($data, "spu_blogs_sedes", true);
        }
        catch(Exception $error){
            die($error->getMessage());
        }
    }

    public function listarDetalleBlog(array $idblog){
        try{
        return parent::execProcedure($idblog, "spu_blog_detalle_listar", true);
        }
        catch(Exception $error){
        die($error->getMessage());
        }
    }

}
/*

$blogs = new Blogs();

$valor = $blogs->listarBlogsSede([1]);

var_dump($valor); 
*/

?>