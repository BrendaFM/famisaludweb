var templateCarouselHeader = String(`
  <div class="carousel-item" data-idcarousel="{idcarousel}">
    <img src="assets/img/medics/bg1.jpg" data-idcarousel="{idcarousel}" class="img-carousel d-block w-100">
  </div>
`);

var templateCarousel = String(`
  <div class='owl-carousel'>

  </div>
`);

var templateSede = String(`
  <div class="item-sede" data-aos="zoom-in" data-aos-delay="100">
  <img src="assets/img/sede_chincha.jpg" class="img-sede" data-idsede="{idsede}">

  <div class="content-hover">
      <h4 class="title-content-hover">SEDE</h4>
      <hr>

      <div class="content-location">
        <h2 class="ubicacion">{sede}</h2>
        <p class="direccion">{direccion}</p>
      </div>

      <a href="#" class="btn btn-info link-sede" data-idsede="{idsede}"><i class="fas fa-share"></i> Conocer la sede </a>
    </div>
  </div>
`);

var templateCampana = String(`
  <div class="colum">
    <div class="box" data-aos="zoom-in" data-aos-delay="100">
      <img class="img-campana" src="assets/img/about-bg.jpg" data-idcampana="{idcampana}">

      <div class="content-text">
        <p>{infocampana}</p>
      </div>

      <div class="footer">
        <a href="index.php?view=campanas" class="btn btn-info btn-more" data-idcampana="{idcampana}"><i class="fas fa-share"></i> Ver más</a>
      </div>
    </div>
  </div>
`);