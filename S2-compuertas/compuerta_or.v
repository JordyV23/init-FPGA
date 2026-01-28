//==============================================================
// or_gate.v
// Módulo combinacional: compuerta OR de 2 entradas
//==============================================================
//
//  - Una compuerta OR produce 1 (alto) si al menos una entrada es 1.
//  - Solo produce 0 si AMBAS entradas son 0.
//
//==============================================================

module or_gate(
    input  wire a,   // entrada A
    input  wire b,   // entrada B
    output wire q    // salida Q
);

    //==========================================================
    // Implementación lógica
    //==========================================================
    // Operador "|" en Verilog = OR bit a bit.
    // La asignación continua "assign" conecta la lógica a la salida.
    
    assign q = a | b;

endmodule