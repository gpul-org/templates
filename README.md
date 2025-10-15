# Plantillas para GPUL Schools (y otros usos)
Estan hechas con [Typst](https://typst.app/docs/)

## Para compilar
```bash
typst compile <file.typ>
```
Para pasar datos
```bash
typst compile <file.typ> --input key=value
```
Generalmente la plantilla va a pedir el path de los datos en formato yaml

## Para desarrollo
```bash
typst watch <file.typ>
```
Recompila al guardar los archivos (recomendable tener un visualizador de pdf que se actualize)

## Indice de plantillas
- Poster
  - Input: data=`yaml{ date: time, start: str, end: str, room: str, name: str, desc: str, logo: path }`
  - Ejemplo:
  ```bash
  typst compile poster.typ --input data=datos.yaml
  ```
  ./datos.yaml:
  ```yaml
  name: charla
  desc: es una charla
  date: 10-11-2025
  start: "10:00"
  end: "12:00"
  room: "3.2"
  logo: logo.png
  ```
  
