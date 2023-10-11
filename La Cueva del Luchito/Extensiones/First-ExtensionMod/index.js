const message = document.querySelector('h1');
const boton = document.querySelector('#cambiar-mensaje');
const message2 = document.querySelector('h1');
const boton2 = document.querySelector('#volver-mensaje');
var sum = 0;
boton.addEventListener('click', () => {
  message.textContent =
    'https://developer.chrome.com/docs/extensions/ <-- Aprendi acá :D';
});

boton2.addEventListener('click', () => {
  message2.textContent = 'Ejemplo';
});

/*function sumar() {
  sum += 2;
  document.getElementById('valorNumero').textContent = sum;
}*/

// Agregar un evento de clic al botón para realizar la suma
document.getElementById('sumarBoton').addEventListener('click', function () {
  // Obtener el valor ingresado por el usuario desde el input
  var numeroIngresado = parseFloat(
    document.getElementById('valorNumero').value
  );

  // Verificar si el valor es un número válido
  if (!isNaN(numeroIngresado)) {
    // Realizar la suma y mostrar el resultado
    var resultado = parseFloat(
      document.getElementById('resultado').textContent
    );
    resultado += numeroIngresado;
    document.getElementById('resultado').textContent = resultado;
  } else {
    alert('Por favor, ingrese un número válido.');
  }
});

document.getElementById('borrarBoton').addEventListener('click', function () {
  resultado = 0;
  document.getElementById('resultado').textContent = resultado;
});
