// Callbacks
// Sin callbacks
function primerPaso(){
  console.log("Este es el premier paso");
}

function segundoPaso(){
  console.log("Este es el segundo paso");
}

// Con callbacks
function primerPasoCallback(callback){
  console.log("Este es el primer paso")
  callback();
}

//primerPasoCallback(segundoPaso)


// PROMESAS
var usuarios = [
  {id: 1, nombre: 'Juan'},
  {id: 2, nombre: 'Maria'},
];

var telefonos = [
  {id: 1, telefono: '956256369'},
  {id: 2, telefono: '986585695'},
];

// Función 1
function getUserFromArray(id){
  return new Promise((resolve, reject) => {
    if(usuarios.find(usuario => usuario.id === id)){
      setTimeout(() => {
        let data = [];
        usuarios.forEach(value => {
          if(value['id'] == id){
            data.push(value);
          }
        });

        console.log(data[0]);
        resolve(getPhoneFromArray(id));

      }, 2000);
    } else {
      reject("Error usuario no encontrado");
    }
  });
}

// Función 2
function getPhoneFromArray(id){
  return new Promise((resolve, reject) => {
    if(telefonos.find(telefono => telefono.id === id)){
      let data = [];
      telefonos.forEach(value => {
        if(value['id'] == id){
          data.push(value);
        }
      });

      resolve(data[0]);
    } else {
      reject("Error telefono no encontrado");
    }
  });
}

// Función 3
function getUserDemo(id){
  return new Promise((resolve, reject) => {
    if(usuarios.find(usuario => usuario.id === id)){
      setTimeout(() => {
        let data = [];
        usuarios.forEach(value => {
          if(value['id'] == id){
            data.push(value);
          }
        });
  
        resolve(data[0].nombre);
      }, 1000);
    } else {
      reject("Error telefono no encontrado");
    }
  });
}

// EJECUTAR PROMESAS
/* getUserFromArray(2)
.then(callback1 => {
  return callback1; // user
})
.then(callback2 => {
  console.log(callback2); // phone
})
.catch(error => {
  console.error(error);
}); */

// FIND DEMO PROMESA

// USANDO ASYNC AWAIT
// async : Indica que la función retornará una promesa
// await : Indicar que el función es asincrono
async function demoAsync1(id){
  try{
    //throw new Error("SOME PROBLEM"); // Error generado
    return await getUserFromArray(id); 
  } catch (error){
    console.error(error)
  }
}

async function demoAsync2(id){
  try{
    //throw new Error("SOME PROBLEM"); // Error generado
    return await getUserDemo(id); 
  } catch (error){
    console.error(error)
  }
}

async function main(){
  try{
    console.time("Tiempo medido");
    // Ejecutar de forma paralela
    const results = await Promise.all([demoAsync1(2), demoAsync2(2)]);

    // Ejecutar de forma secuencial
    //const val1 = await demoAsync1(1);
    //const val2 = await demoAsync2(1);

    console.log(results[0])
    console.log("El usuario es:", results[1])
    console.timeEnd("Tiempo medido");
  } catch (error){
    console.error(error)
   }
}

//main();