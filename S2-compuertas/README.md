# S2: Compuertas Lógicas

## Objetivo de la Práctica
Implementar y simular compuertas lógicas básicas utilizando Verilog para entender los fundamentos del diseño digital y la simulación en FPGA.

## Contenido

### Archivos Principales
- `compuerta_or.v` - Módulo de compuerta OR de 2 entradas
- `tb_compuerta_or.v` - Testbench para probar la compuerta OR

### Archivos de Recursos Adicionales
- `Recursos/and_gate.v` - Ejemplo de compuerta AND
- `Recursos/tb_and_gate.v` - Testbench para compuerta AND

## Descripción del Módulo

### Compuerta OR (`compuerta_or.v`)
```verilog
module or_gate(
    input  wire a,   // entrada A
    input  wire b,   // entrada B
    output wire q    // salida Q
);

    assign q = a | b;

endmodule
```

**Funcionamiento:**
- Una compuerta OR produce 1 (alto) si al menos una entrada es 1
- Solo produce 0 si AMBAS entradas son 0
- Utiliza el operador "|" de Verilog para OR bit a bit

### Testbench (`tb_compuerta_or.v`)
El testbench realiza las siguientes pruebas:
1. **Caso 1:** A=0, B=0 → Q=0
2. **Caso 2:** A=0, B=1 → Q=1  
3. **Caso 3:** A=1, B=0 → Q=1
4. **Caso 4:** A=1, B=1 → Q=1

## Compilación y Simulación

### Comandos para Icarus Verilog:
```bash
# Compilar el diseño y testbench
iverilog -o simulacion_compuerta_or.vvp compuerta_or.v tb_compuerta_or.v

# Ejecutar la simulación
vvp simulacion_compuerta_or.vvp
```

### Comando para GTKWave (visualizar formas de onda):
```bash
gtkwave compuerta_or.vcd
```

## Resultados Esperados

### Tabla de Verdad Compuerta OR:
| A | B | Q |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 1 |

### Salida de Consola:
```
A B | Q
-----
0 0 | 0
0 1 | 1
1 0 | 1
1 1 | 1
```

## Evidencia de Ejecución
- `Recursos/EvidenciaEjecucionOR.png` - Captura de pantalla de la simulación
- `compuerta_or.vcd` - Archivo de volcado de variables para GTKWave
- `simulacion_compuerta_or.vvp` - Archivo ejecutable compilado

## Preguntas Generadoras para Reflexión

### Fundamentos Teóricos:
1. **¿Qué es una compuerta lógica y cuál es su función en los circuitos digitales?**
2. **¿Por qué la compuerta OR se considera una operación fundamental en el álgebra de Boole?**
3. **¿Cómo se relaciona la tabla de verdad con el comportamiento físico de los transistores?**

### Implementación en Verilog:
4. **¿Por qué se utiliza `assign` para la implementación combinacional?**
5. **¿Qué diferencia existe entre `wire` y `reg` en Verilog?**
6. **¿Cómo afecta el operador "|" al nivel de bits en Verilog?**

### Simulación y Verificación:
7. **¿Por qué es importante probar todas las combinaciones posibles de entrada?**
8. **¿Qué purpose cumple el `$dumpfile` y `$dumpvars` en el testbench?**
9. **¿Cómo se relaciona el tiempo de simulación (#10) con el comportamiento real del hardware?**

### Aplicaciones Prácticas:
10. **¿En qué tipos de circuitos reales se utilizan compuertas OR?**
11. **¿Cómo se podrían combinar múltiples compuertas OR para crear funciones más complejas?**
12. **¿Qué ventajas ofrece implementar estas funciones en FPGA frente a hardware discreto?**

### Diseño Digital:
13. **¿Cómo se podría optimizar este diseño para múltiples entradas?**
14. **¿Qué considerations de temporización deben tenerse en cuenta?**
15. **¿Cómo se podrían implementar otras compuertas (AND, NOT, XOR) siguiendo el mismo patrón?**

## Extensiones Sugeridas

1. **Implementar compuertas adicionales:** AND, NOT, NAND, NOR, XOR, XNOR
2. **Crear un módulo de compuertas universales** que soporte diferentes operaciones
3. **Diseñar circuitos combinacionales más complejos** utilizando múltiples compuertas
4. **Optimizar para diferentes velocidades de clock** y consideraciones de temporización

## Conclusiones

Esta práctica introduce los conceptos fundamentales del diseño digital utilizando Verilog, estableciendo las bases para el desarrollo de sistemas más complejos en FPGA. La comprensión de las compuertas lógicas es esencial para cualquier diseñador de sistemas digitales.