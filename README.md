# TP1-Bash

Repositorio para trabajar el TP1 de Bash.

---

## 📅 Información general

- **Fecha de entrega:** 25/03/2025  
- **Modalidad:** Clase presencial y obligatoria  
- **Grupos:** Hasta 4 personas  
- **Entrega:** Link de GitHub mediante formulario  
- **Lenguaje:** Bash  
- **Repositorio:** Público, uno por grupo  

---

## 🧾 Descripción

Se debe desarrollar un script que permita, mediante un menú, realizar distintas operaciones sobre un sistema Linux o macOS.

El script:
- Puede recibir un **parámetro optativo**
- Utiliza una **variable de entorno** llamada `FILENAME` para guardar el nombre de un archivo

---

## 📁 Estructura requerida

Dentro del directorio `home`, se debe crear la siguiente estructura:

EPNro1/
├── entrada/
├── salida/
└── procesado/


---

## 📋 Menú de opciones

### 1) Crear entorno
Crea el directorio `EPNro1` dentro del home con las subcarpetas:
- `entrada`
- `salida`
- `procesado`

---

### 2) Correr proceso
Ejecuta en **background** un script llamado `consolidar.sh` ubicado en `EPNro1`.

Este script debe:
- Tomar cada archivo que ingresa en `entrada`
- Agregar su contenido al final de:  
  `salida/FILENAME.txt`
- Luego mover el archivo original a `procesado`

---

### 3) Listar alumnos por padrón
Si existe `FILENAME.txt` en `salida`, mostrar:
- Listado de alumnos
- Ordenado por número de padrón

---

### 4) Top 10 notas
Si existe `FILENAME.txt`, mostrar:
- Las 10 notas más altas

---

### 5) Buscar alumno por padrón
- Solicitar un número de padrón
- Mostrar los datos correspondientes desde `FILENAME.txt`

---

### 6) Salir
Finaliza la ejecución del script.

---

## ⚙️ Parámetro opcional

### `-d`
Si el script se ejecuta con este parámetro:
- Se elimina todo el entorno `EPNro1`
- Se finalizan los procesos en background creados

---

## 📌 Consideraciones

- Los archivos en `entrada`:
  - Pueden tener cualquier nombre
  - Deben tener extensión `.txt`

- Formato de los archivos:

Nro_Padrón Nombre_Apellido Email Nota


- Ejemplo:

122332 Juan Lopez jlopez@fi.uba.ar 8
100998 Pedro Valdéz pvaldez@fi.uba.ar 5
89032 Carla Simone csimone@fi.uba.ar 7
77542 Franco Lomba flomba@fi.uba.ar 10
100223 Juana Pola jpola@fi.uba.ar 4
122435 Lucia Fernandez lfernandez@fi.uba.ar 9


---

## 🧠 Supuestos

- No es necesario validar el formato de los archivos
- Los padrones son únicos
- No hay registros duplicados

---

## 🚀 Objetivo

Aplicar conceptos de Bash scripting:
- Manejo de archivos y directorios
- Procesos en background
- Variables de entorno
- Parsing de archivos de texto
- Uso de comandos del sistema

---