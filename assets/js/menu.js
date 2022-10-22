// Open
$('.check-menu').click(function(){

  if($(this).is(':checked')){
    checkedMenu();
  } else {
    notChecked();
  }

  alternateClase();
});

// Checked
function checkedMenu(){
  $('#check-menu-sidebar').prop('checked', true);
  $('#check-menu').prop('checked', true);
}

// no check
function notChecked(){
  $('#check-menu').prop('checked', false);
  $('#check-menu-sidebar').prop('checked', false);
}

// Toggle clasd
function alternateClase(){
  //$('body').toggleClass('translate-body');
  $('.wrapper').toggleClass('translate-wrapper');
  $('#sidebar-right').toggleClass('show-sidebar-right');
}

// Abrir submenu
$("#sidebar-right .navbar-right .dropdown > a").click(function(e){
  e.preventDefault()
  this.nextElementSibling.classList.toggle('dropdown-active')
});


$("#sidebar-right .nav-link").click(function(){  
  notChecked();
  $('.wrapper').removeClass('translate-wrapper');
  $('#sidebar-right').removeClass('show-sidebar-right');
});



/**
 * Easy selector helper function
 */
  const select = (el, all = false) => {
  el = el.trim()
  if (all) {
    return [...document.querySelectorAll(el)]
  } else {
    return document.querySelector(el)
  }
}


/**
 * Easy on scroll event listener 
 */
  const onscroll = (el, listener) => {
  el.addEventListener('scroll', listener)
}


/**
 * Preloader
 */
let preloader = select('#preloader');
if (preloader) {
  window.addEventListener('load', () => {
    preloader.remove();
  });
}


/**
 * Toggle .header-scrolled class to #header when page is scrolled
 */
let selectHeader = select('#header')
if (selectHeader) {
  const headerScrolled = () => {
    if (window.scrollY > 100) {
      selectHeader.classList.remove('bg-active')
    } else {
      // Validar view
      if(getParamUrl('view') != 'home' && getParamUrl("view") != undefined){
        selectHeader.classList.add('bg-active')
      } 
    }
  }
  window.addEventListener('load', headerScrolled)
  onscroll(document, headerScrolled)
}



