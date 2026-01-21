# Diario de Ingeniería: Mi Primer "Hola Mundo" en Verilog

**Fecha:** 20 de enero de 2026
**Objetivo:** Configurar el entorno de simulación y verificar un flujo de diseño básico (Entrada -> Salida).

## Preparacion del Entorno

Para esta ocasion se siguieron a detalle las indicaciones dentro del sigueinte manual.

📁 **Recursos Disponibles:**
- 📖 [Guía de Instalación Icarus Verilog-MSYS2-VSCode](./Recursos/Guia%20Instalacion%20Icarus%20Verilog-MSYS2-VSCode.pdf)

## Herramientas Utilizadas

* [cite_start]**Editor:** Visual Studio Code[cite: 5, 8].
* [cite_start]**Entorno:** MSYS2 (Consola MinGW64)[cite: 5, 18].
* [cite_start]**Compilador:** Icarus Verilog[cite: 10, 28].
* [cite_start]**Visualizador:** GTKWave[cite: 10, 28].

## Descripción del Diseño

El módulo `hola_mundo.v` actúa como un puente simple donde la salida `y` sigue el estado lógico de la entrada `a`. El testbench genera un estímulo que cambia el estado de `a` cada 10ns durante un periodo de 100ns.

## Bitácora de Ejecución

1. Se compiló el código con `iverilog`.
2. Se generó el archivo de simulación con `vvp`.
3. Se visualizaron las formas de onda en `GTKWave`.

## Comandos utilizados

### Moverse al directorio

El siguiente comando posiciona la terminal en la carpeta de trabajo. En MSYS2, el disco local C: se monta como /c/. Usar comillas es vital para que el sistema ignore los espacios en nombres como "I Cuatrimestre"

```bash
cd '/C/Users/jordy/Documents/ULACIT/I Cuatrimestre/Fundamentos en FDPG/S1-HolaMundo/S1-hola-mundo'
```

### Compilar el testbench

iverilog es el compilador que transforma el código de descripción de hardware (Verilog) en un formato que la computadora puede entender para simular.
Va a leer el módulo principal (_hola_mundo_.v) y el test bench (tb_hola_mundo.v) para verificar que no existan errores de sintaxis
Generando asi un archivo binario llamado simulacion.vvp, este es basicamente un archivo de lenguaje ensamblador para la máquina virtual VVP
El cual Contiene:

- La Red de Conexiones (Netlist): Una descripción de cómo se conectan los cables (wire a, wire y) y módulos (hola, tb_hola_mundo).

- Instrucciones de Tiempo: Las órdenes que le dicen al simulador que espere 10 ns antes de cambiar una señal (#10 a = ~a).

- Directivas de Volcado: Las instrucciones para que, al ejecutarse, se cree el archivo de ondas tb_hola_mundo.vcd.

Para esto se ejecuta el siguiente comando:

```bash
iverilog -o simulacion.vvp hola_mundo.v tb_hola_mundo.v
```

### Ejecución de la Simulación (VVP)

vvp es el motor de simulación de Icarus. Aca lo que hace es "Correr" el archivo generado en el paso anterior. Aquí es donde se ejecutan los bloques initial y forever escritos en el test bench.

Al finalizar, el sistema genera el archivo de ondas tb_hola_mundo.vcd. Este archivo contiene el historial de cada cambio de valor de las señales (a y y) en el tiempo.

```bash
vvp simulacion.vvp -> Da como resultado un "tb_hola_mundo.vcd"
```

### Visualizar en gtk_wave

gtkwave es el visualizador de señales digitales. Abre una interfaz gráfica que permite ver las señales como ondas cuadradas.
Una vez en GTKWave, se debe de buscar el nombre del test bench en el panel izquierdo, luego se debe de seleccionar las señales y presionar "Insert" para verlas en la línea de tiempo.  

```bash
gtkwave tb_hola_mundo.vcd
```

### Resultado

Quizas para comprender un poco mejor el resultado, del directorio de Recursos de esta semana, existe un archivo de evidencia.

- 🖼️ [Evidencia de Ejecución](./Recursos/EvidenciaDeEjecucion.png)

---
