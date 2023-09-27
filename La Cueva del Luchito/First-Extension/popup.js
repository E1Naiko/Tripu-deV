const message = document.querySelector('h1');
const boton = document.querySelector('#cambiar-mensaje')

boton.addEventListener('click', () => {
    message.textContent = "https://www.youtube.com/watch?v=JxbMHSvI2DA <-- Aprendi acá :D"
})