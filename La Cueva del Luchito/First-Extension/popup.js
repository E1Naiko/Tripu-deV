const message = document.querySelector('h1');
const boton = document.querySelector('#cambiar-mensaje')

boton.addEventListener('click', () => {
    message.textContent = "https://developer.chrome.com/docs/extensions/ <-- Aprendi acá :D"
})