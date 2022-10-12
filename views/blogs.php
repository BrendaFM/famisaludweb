

<div class="page-header">
    <div class="container">
        <h1 class="title">Ultimas Novedades</h1>
    </div>
</div>
<div class="container-data">
    <div class="container-page container-controls">
        <div class="row">
            <h4 class="title text-center d-none">Selecciona:</h4>

            <div class="col-md-4"></div>
            <div class="col-md-4">
            <select class="form-select  selectespecialidad text-gray " id="idsede" >
                <!--Se carga automaticamente-->
            </select>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
    <div class="container-page content-header">
        <h4 class="title">Resultados:</h4>
    </div>
    <div class="container-page container-cards"  data-aos="fade-up" id="cards-blog">
        <!-- CFargados asincronicamente box -->
    </div>
</div>
<div class="modal fade" id="modalBlog" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title d-none" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="container-data-modal">
                    <div id="detalleblog" ></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {

        function Blogs() {
            var datosEnviar = {
                'op': 'listarBlog'
            };
            $.ajax({
                url: 'controllers/Blogs.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result) {
                    $("#cards-blog").html(result);
                }
            });
        }

        function SedesCargar() {
            var datosEnviar = {
                'op': 'listarSede'
            };
            $.ajax({
                url: 'controllers/Sede.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result) {
                    $("#idsede").html(result);
                }
            });
        }


        SedesCargar();

        $("#idsede").change(function() {
            var datosEnviar = {
                'op': 'listarBlogsSede',
                'idsede': $(this).val()
            };

            $.ajax({
                url: 'controllers/Blogs.controller.php',
                type: 'GET',
                data: datosEnviar,
                success: function(result) {
                    $("#cards-blog").html(result);
                }
            });

        });

        $("#cards-blog").on("click", ".mostrarblog", function(){
            let idblog = $(this).attr('id-blog');

            $.ajax({
                    url:    'controllers/Blogs.controller.php',
                    type:   'GET',
                    data:   'op=listarDetalleBlog&idblog=' + idblog,
                    success: function(result){
                        $("#detalleblog").html(result);  
                                         
                    }
                });
        });


        Blogs();
    });
</script>