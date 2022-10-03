<style>

    .selectespecialidad {
        border-color: gray;
        padding-top: 0.8em;
        padding-bottom: 0.8em;
        padding-left: 2em;
        padding-right: 2em;
        border-radius: 30px;
    }

    .size-font{
        font-size: 24px;
    }

    .select-select{
        margin-top: -3em;
    }
    .group-cards-farmacia .card{
        transition: all 0.5s ease-in-out;
    }

    .group-cards-farmacia .card:hover{
        transform: translateY(-1.5%);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    }


    .group-cards-farmacia .card img{
        padding: 1rem;
        width: 100%;
        height: 249px;
        background-size: cover; 
        object-fit: cover;
        object-position: center center;
        transition: all 1s ease-in-out;
        border-radius: 25px;
    }
    
    .img-responsive-producto{
        
        width: 100%;
        height: 466px;
    }


    /* tablet */
    @media(max-width: 912px){
        .img-responsive-producto{
            width: 100%;
            height: 300px;
        }
        
        .card-farmacia{
            width: 50%;
        }
        
        #detalleproducto{
            margin: 0;
            padding: 0;
        }
    }
    /* movil */
    @media(max-width: 468px){
        .img-responsive-producto{
            width: 100%;
            height: 300px;
        }

        .card-farmacia{
            width: 100%;
        }
    }

</style>


<!-- CONTAINER DE TITULO -->

<div class="page-header">
    <div class="container">
        <h1 class="title">FARMACIA</h1>
    </div>
</div>

<div class="container politics">
    <br>
    <br>
    <br>
    <div class="row">
        <div class="col-md-4"></div>
        
        <div class="col-md-4 select-select">
            <select class="form-select  selectespecialidad text-gray " id="idsede" aria-label=".form-select-md example">
                <!--Se carga automaticamente-->
            </select> 
        </div>
        <div class="col-md-4"></div>
    </div>      
</div>

<br>
<br>
<br>

<div class="container ">
    <div class="row group-cards-farmacia" style="margin-left: 3em;" id="cards-producto">
        
    </div>
</div>

<br>
<br>
<br>

    <!-- Modal Body -->
    <!-- if you want to close by clicking outside the modal, delete the last endpoint:data-bs-backdrop and data-bs-keyboard -->
    <div  class="modal fade"  id="modalId" tabindex="-1" data-bs-backdrop="static" data-bs-keyboard="false" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl" role="document">
            <div class="modal-content modal-sedes">                
                <div class="modal-body">
                    <div>
                         <button type="button" class="btn float-end" data-bs-dismiss="modal"><i class="fas fa-times"></i></button>

                        <div id="detalleproducto" class="row " >
                            <!--Se carga automaticamente-->
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>

    

    
    <script>
        const myModal = new bootstrap.Modal(document.getElementById('modalId'), options);
    </script>


<script>
        $(document).ready(function (){

            function listarEspecialidades(){
                var datosEnviar = {
                    'op'            : 'listarEspecialidades'
                };

                $.ajax({
                    url: 'controllers/Especialidad.controller.php',
                    type: 'GET',
                    data: datosEnviar,
                    success: function(result){
                        $("#cards-especialidad").html(result);
                    }
                });
            }

            $("#idsede").change(function (){

                var datosEnviar = {
                    'op'          : 'listarProductoPorSede',
                    'idsede'      : $(this).val()
                };

                $.ajax({
                    url: 'controllers/Producto.controller.php',
                    type: 'GET',
                    data: datosEnviar,
                    success: function(result){
                            $("#cards-producto").html(result);
                    }
                });

            });

            $("#cards-producto").on("click", ".mostrar", function(){
                let idproducto = $(this).attr('id-codigo');
                
                $.ajax({
                    url: 'controllers/Producto.controller.php',
                    type: 'GET',
                    data: 'op=detalleproducto&idproducto=' + idproducto,
                    success: function(result){
                        $("#detalleproducto").html(result);                       
                    }
                });
            });


            function filtrarSedesConProductos(){
                $.ajax({
                    url: 'controllers/Producto.controller.php',
                    type: 'GET',
                    data: 'op=filtrarSedesConProductos',
                    success: function(result){
                        $("#idsede").html(result);
                    }
                });
            }

        listarEspecialidades();
        filtrarSedesConProductos();

        });
    </script>