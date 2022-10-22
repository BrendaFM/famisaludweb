
<div class="page-header">
    <div class="container">
        <h1 class="title">Cotiza tu Protocolo</h1>
    </div>
</div>

<!-- ======= Contact Section ======= -->
<section id="contact" class="contact">
  <div class="container" data-aos="fade-up">
    <h2 class="section-title text-center">Por favor brindanos su información</h2>
  </div>

  <div class="container" data-aos="fade-up">
    <div class="row">
      <div class="col-lg-12 mt-lg-0">
        <form autocomplete="off" class="php-email-form" id="form-solicitud">
          <div class="row">
            <div class="col-md-4 form-group mb-2">
              <input type="text" maxlength="50" class="form-control round-50" id="name" placeholder="Nombres" required>
            </div>
            <div class="col-md-4 form-group mb-2">
              <input type="text" maxlength="100" class="form-control round-50" id="razonsocial" placeholder="Empresa" required>
            </div>
            <div class="col-md-4 form-group mb-2">
              <input type="tel" maxlength="11" id="phone" class="form-control round-50" placeholder="Teléfono (6 - 11 Dígitos)">
            </div>
            <div class="col-md-12 form-group mb-2">
              <input type="email" maxlength="100" class="form-control round-50" id="email" placeholder="Correo Electrónico" required>
            </div>            
          </div>
          <div class="form-group">
            <textarea class="form-control round-20" maxlength="250" id="message" rows="8" placeholder="Mensaje" required></textarea>
          </div>
          <div class="my-3">
            <div class="loading">Enviando...</div>
            <div class="error-message">Error</div>
            <div class="sent-message">Su mensaje ha sido enviado con Éxito!</div>
          </div>
          <div class="col-md-3 mb-2">
            <!-- Codigo del dominio -->
            <div class="g-recaptcha" data-sitekey="6Le_NDIiAAAAAFQwgWPauLbkoDuC7ClnaoFSQllS">
            </div>
          </div>
          <div class="text-center"><button type="button" id="btn-sendMailer">Enviar Mensaje</button></div>
        </form>

      </div>
    </div>

  </div>
</section><!-- End Contact Section -->

<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="views/templates/home.template.js"></script>
<script src="assets/js/home.js"></script>