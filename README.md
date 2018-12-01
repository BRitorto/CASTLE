# CASTLE

## Construccion:
-----------------------------

El proyecto cuenta con un Makefile. Para utilizarlo, posicionarse dentro
de /CASTLE y hacer:

```sh
$ make
```
Así se genera el binario "castle" que será utilizado para compilar los programas.

## Compilacion y Ejecución de los programas:
----------------------------------

Debe posicionarse dentro de la carpeta principal del proyecto
/CASTLE.
Se pueden compilar sus programas de prueba con el script "compile"
que se encuentra en el directorio raiz del repositorio.

```sh
$ sh compile ./path/a/su/programa
```
Por ejemplo, para correr alguno de nuestros ejemplos, haga:

```sh
$ sh compile ./examples/triviaBase
```

Lo anterior generara un archivo Main.class ya que el lenguaje traduce a JAVA.
Para ejecutar el programa, puede utilizar el otro script "run" que también
está presente en el directorio raiz, por lo que deberá estar posicionado una vez más
dentro de /CASTLE. Para utilizarlo ejecute:

```sh
$ sh run
```

## Requerimientos
----------------------------

- Libreria dk.brics.automaton con licencia MIT disponible en: <https://github.com/cs-au-dk/dk.brics.automaton>
- Tener instalado el jdk correspondiente

## Ubicacion de los materiales
----------------------------

* Informe TPE: Se encuentra en la raiz del proyecto con el nombre: "Informe TLA.pdf"
* Programas ejemplo: Se encuentran en la carpeta "examples"
* Los scripts de ayuda "compiler" y "run" se encuentran en la raiz del proyecto

## Autores
-----------------------------

* **Bianca Ritorto**
* **Clara Guzzetti**
* **Constanza De Rienzo**
* **Lucas Sanz Gorostiaga**
