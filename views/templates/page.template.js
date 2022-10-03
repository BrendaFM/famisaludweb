var templateBox = String(`
  <div class='box'>
    <div class='box-header'>
      <img src='../assets/img/campanas/events-bg.jpg' alt=''>
    </div>
    <div class='box-body'>
      <h5 class='subtitle'>Especialidad</h5>
      <h3 class='title'>Cardiología </h3>
      <p class='paragraph'>
        Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odit, amet, similique facilis vel alias dolore
        aliquam a culpa assumenda modi temporibus deleniti nemo, fugit dignissimos atque eos est veritatis sed
        fugiat cupiditate cum non eaque? Tempore deserunt neque optio perspiciatis porro quasi provident tenetur
        repellendus? Nulla quibusdam veritatis modi repellendus?
      </p>
    </div>
    <div class='box-footer'>
      <button type='button' class='btn btn-show-more' data-bs-toggle='modal' data-bs-target='#modalDemo'>
        <span>Ver más</span>
        <i class='fas fa-arrow-circle-right'></i>
      </button>
    </div>
  </div>
`);

var templateModal = String(`
<div class='container-data-modal'>
  <div class='row'>
    <div class='col-lg-6 mb-2 form-group d-flex flex-column justify-content-evenly lign-content-around'>
      <h2 class='title'>Medicina General</h2>
      <hr>
      <p class='paragraph'>
        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Dolores doloremque ducimus debitis blanditiis numquam repellat odio voluptatibus, at tempore ea quam porro labore! Reiciendis, facilis.
      </p>
      <div class='content-hours'>
        <h5>Horario de atención</h5>
        <p>
          Lorem, ipsum dolor sit amet consectetur elit. Ex, nostrum.
        </p>
      </div>
    </div>
    <div class='col-lg-6 mb-2 form-group d-flex justify-content-center'>
      <div class='content-image'>
        <img src='../assets/img/ambulances/ambulance_4.jpg' alt=''>
      </div>
    </div>
  </div>
  
  <hr>

  <div class='container-sedes'>
    <div class='card body'>
      <h5 class='subtitle'>Sede</h5>
      <h4 class='campus'>Chincha</h4>
      <p class='direction'>Dirección</p>
    </div>
    <div class='card body'>
      <h5 class='subtitle'>Sede</h5>
      <h4 class='campus'>Chincha</h4>
      <p class='direction'>Dirección</p>
    </div>
    <div class='card body'>
      <h5 class='subtitle'>Sede</h5>
      <h4 class='campus'>Chincha</h4>
      <p class='direction'>Dirección</p>
    </div>
  </div>
</div>
`);

var templateBoxSeparate = String(`
<div class="box box-separate">
  <div class="box-header">
    <img src="../assets/img/campanas/events-bg.jpg" alt="">
  </div>
  <div class="box-body">
    <h5 class="subtitle text-center name">Nombre y Apellidos</h5>
    <strong>ESPECIALIDAD:</strong> <span>médicina general</span> <br>
    <strong>CMP:</strong> <span>médicina general</span> <br>
    <strong>RNE:</strong> <span>médicina general</span> <br>
  </div>
</div>
`);