//==============================================================
// and_gate.v
// Módulo combinacional: compuerta AND de 2 entradas
//==============================================================
//
// Idea clave:
//  - Una compuerta AND produce 1 (alto) SOLO si ambas entradas son 1.
//  - Si cualquiera de las entradas es 0, la salida es 0.
//
// Tabla de verdad:
//   a  b | y
//  ------|---
//   0  0 | 0
//   0  1 | 0
//   1  0 | 0
//   1  1 | 1
//
//==============================================================

// La palabra reservada "module" define un bloque de hardware.
// Aquí definimos un bloque llamado "and_gate".
module and_gate(
    // "input" indica señales que ENTRAN al módulo.
    // En hardware real serían pines de entrada.
    input  wire a,   // entrada a (tipo wire porque es una conexión)
    input  wire b,   // entrada b
    // "output" indica señal que SALE del módulo.
    output wire y    // salida y
);

    //==========================================================
    // Implementación lógica
    //==========================================================
    // "assign" se usa para lógica combinacional (sin memoria).
    // En hardware: esto se traduce a compuertas / lógica cableada.
    //
    // Operador "&" en Verilog = AND bit a bit.
    // Como a y b son de 1 bit, funciona como AND simple.
    assign y = a & b;

endmodule
