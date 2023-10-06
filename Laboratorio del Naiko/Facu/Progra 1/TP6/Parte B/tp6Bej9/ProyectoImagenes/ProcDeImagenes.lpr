program ProcDeImagenes;

uses  Imagenes;

  // Implementar aqui los modulos de la practica

var
  imgOrigen, imgDestino: ImagenRGB;

  
begin
  cargarImagen('casa.jpg', imgOrigen);

  // invocar el modulo a probar

  guardarImagen('casa-esp.jpg', imgDestino);

end.
