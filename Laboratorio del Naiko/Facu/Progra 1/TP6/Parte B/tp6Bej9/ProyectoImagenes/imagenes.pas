unit Imagenes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  Color = record
    r: integer;
    g: integer;
    b: integer;
  end;

  ImagenRGB = record
    ancho: integer;
    alto: integer;
    datos: array[1..1024, 1..1024] of Color;
  end;


  procedure cargarImagen(archivo: string; var img: ImagenRGB);

  procedure guardarImagen(archivo: string; img: ImagenRGB);

  procedure MostrarImagen(img: ImagenRGB);


implementation
 uses   IntfGraphics,
  fpImage,
  Graphics,
  GraphType,
  Windows;


  procedure cargarImagen(archivo: string; var img: ImagenRGB);
  var
    AImage: TLazIntfImage;
    lRawImage: TRawImage;
    f, c: integer;
  begin

    lRawImage.Init;
    lRawImage.Description.Init_BPP32_A8R8G8B8_BIO_TTB(0, 0);
    lRawImage.CreateData(False);
    AImage := TLazIntfImage.Create(0, 0);
    try
      AImage.SetRawImage(lRawImage);
      AImage.LoadFromFile(archivo);
      if (AImage.Width > 1024) then
      begin
        img.ancho := 1024;
      end
      else
      begin
        img.ancho := AImage.Width;
      end;
      if (AImage.Height > 1024) then
      begin
        img.alto := 1024;
      end
      else
      begin
        img.alto := AImage.Height;
      end;
      for f := 1 to img.alto do
      begin
        for c := 1 to img.ancho do
        begin
          img.datos[f, c].r := AImage.Colors[c - 1, f - 1].red;

          img.datos[f, c].b := AImage.Colors[c - 1, f - 1].blue;
          img.datos[f, c].g := AImage.Colors[c - 1, f - 1].green;
        end;
      end;
    finally
      AImage.Free;
    end;
  end;


  procedure guardarImagen(archivo: string; img: ImagenRGB);
  var
    AImage: TLazIntfImage;
    lRawImage: TRawImage;
    f, c: integer;
    Value: TFPColor;
  begin
    lRawImage.Init;
    lRawImage.Description.Init_BPP32_A8R8G8B8_BIO_TTB(img.ancho, img.alto);
    lRawImage.CreateData(True);
    AImage := TLazIntfImage.Create(0, 0);
    AImage.SetRawImage(lRawImage);
    try
      for f := 1 to img.alto do
      begin
        for c := 1 to img.ancho do
        begin
          Value.red := img.datos[f, c].r;
          Value.green := img.datos[f, c].g;
          Value.blue := img.datos[f, c].b;
          //writeln(Value.red,' ',Value.green, ' ',Value.blue);
          AImage.Colors[c - 1, f - 1] := Value;
        end;
      end;

      AImage.SaveToFile(archivo);
    finally
      AImage.Free;
    end;
  end;


procedure OpenWithAssociatedProg(aFilePath, aFileName: string); overload;
var
  Params: string;
begin
  Params := '';
    if (aFileName <> '') and FileExists(aFilePath + aFileName) then
      // Calls automatically the program associated with the file type.
      ShellExecute(0, 'open',
                PChar(aFileName),             // FileName
                PChar(Params),                // Parameters
                PChar(aFilePath),             // Current Directory
                SW_SHOWNORMAL);               // ShowCmd
end;

procedure MostrarImagen(img: ImagenRGB);
var fname:String;
begin
  fname:= 'img-temp.jpg';
  guardarImagen(fname, img);
  OpenWithAssociatedProg( '', fname);
end;

end.

