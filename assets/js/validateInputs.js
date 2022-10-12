// Constantes expresiones regulares
const expressions = {
  user: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo, 4 a 16 digitos
  name: /^[a-zA-ZÀ-ÿ\s]{4,40}$/, // Letras y espacios, pueden llevar acentos.
  service: /^[a-zA-ZÀ-ÿ0-9\s]{4,40}$/, // Letras y espacios, pueden llevar acentos.
  any : /^[^$%&|<>#]*$/,
  password: /^.{4,15}$/, // 4 a 15 digitos.
  email: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
  phone: /^\d{6,11}$/ // 9 a 11 numeros.
}

// Validar campos, compara valores de los campos con los array de expresion asociados
function validateInput(expression, input) {
  // TEST(): Busca coincidencia con la expresión asociada y devuelve (true / false)
  let result = false;

  if (expression.test(input.val())) {
    input.removeClass("is-invalid");
    input.addClass("is-valid");
    result = true;
  } else {
    input.removeClass("is-valid");
    input.addClass("is-invalid");
    result = false;
  }

  return result;
}


// Cambiar Tipo al input
function changeTypeInput(selector, type, maxlength = 15) {
  selector.attr('type', type);
  selector.attr('maxlength', maxlength);
}
