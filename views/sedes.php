<style>

    .hover{
        width: 25em;
        height: 25em;
        overflow: hidden;
        position: relative;
        cursor: pointer;
        align:center;

    }

    .hover img{
        width: 25em;
        height: 25em;
        transition: all 300ms;
    }

    .hover h2{
        position: absolute;
        font-family: 'Open Sans';
        font-weight: bold;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%) scale(0);
        color: white;
        z-index: 2;
        transition: all 600ms cubic-bezier(1,0,0,1);
    }
    .hover h3{
        position: absolute;
        font-family: 'Open Sans';
        font-weight: bold;
        top: 60%;
        left: 50%;
        transform: translate(-50%, -50%) scale(0);
        color: white;
        z-index: 2;
        transition: all 600ms cubic-bezier(1,0,0,1);
    }

    .hover:hover h2{
        transform: translate(-50%, -50%) scale(1);
        font-family: 'Open Sans';
        font-weight: bold;
        margin-bottom: 100px;
    }
    .hover:hover h3{
        transform: translate(-60%, -50%) scale(1);
        font-family: 'Open Sans';
        font-weight: bold;
        margin-bottom: 100px;
    }

    .hover:before,
    .hover:after{
        content: '';
        width: 25em;
        height: 25em;
        position: absolute;
        top: 0;
        left: 0;
        background: #055bb7;
        opacity: 0.5;
        transition: all 600ms cubic-bezier(1,0,0,1);
        z-index: 1;
    }

    .hover:before{
        transform: translateX(-550px);
    }

    .hover:after{
        transform:  translateX(550px);
    }

    .hover:hover:before{
        transform:  translateX(-1px);
    }

</style>


<a href="index.php?view=sedesdetalle">Sedes a</a>

    <div class="container">
        <div class="row " >
            <div class="card-body col-md-3 m-1">
                <div class="hover">
                <h2>Sede </h2>
                <h3>Lima</h3>
                    <img src="assets/img/hero-bg.jpg" alt="">
                    <hr>
                </div>
            </div>
            <div class="card-body col-md-3  m-1">
                <div class="hover">
                <h2>Sede</h2>
                <h3>Chincha</h3>
                    <img src="assets/img/hero-bg.jpg" alt="">
                    <hr>
                </div>
            </div>
            <div class="card-body col-md-3  m-1">
                <div class="hover">
                <h2>Sede</h2>
                <h3>Pisco</h3>
                    <img src="assets/img/hero-bg.jpg" alt="">
                    <hr>
                </div>
            </div>
        
        </div>
    </div>
    
    <button type="button" id="lima" class="btn btn-primary" value="1"><a href="index.php?view=sedesdetalle" style="color: white">Lima</a></button>
    <button type="button" id="chincha" class="btn btn-primary" value="2"><a href="index.php?view=sedesdetalle" style="color: white">Chincha</a></button>
    <button type="button" id="pisco" class="btn btn-primary" value="3"><a href="index.php?view=sedesdetalle" style="color: white">Pisco</a></button>

    <button type="button" id="2" class="btn btn-primary" value="2"> Ver</button>
    <button type="button" id="3" class="btn btn-primary" value="3"> Quitar</button>
   
<script>
    $(document).ready(function (){
        function lima(){
            let idsede = $("#lima").val();
            
            localStorage.setItem('idsede', idsede);
            console.log(idsede);
        }

        function chincha(){
            let idsede = $("#chincha").val();
            
            localStorage.setItem('idsede', idsede);
            console.log(idsede);
        }

        function pisco(){
            let idsede = $("#pisco").val();
            
            localStorage.setItem('idsede', idsede);
            console.log(idsede);
        }
        
        function ver(){
            var cat = localStorage.getItem('idsede');
            console.log(cat);
        }

        function quitar(){
            localStorage.removeItem("idsede");
            var cat = localStorage.getItem('idsede');
            console.log(cat);
        }

        $("#lima").click(lima);
        $("#chincha").click(chincha);
        $("#pisco").click(pisco);
        $("#2").click(ver);
        $("#3").click(quitar);

    });
    
</script>