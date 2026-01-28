//==============================================================
// tb_and_gate.v
// Testbench para probar el módulo and_gate
//==============================================================
//
// ¿Qué es un testbench?
// - Es un "circuito de prueba" que NO se sintetiza a hardware.
// - Solo sirve en simulación para generar estímulos (entradas)
//   y observar resultados (salidas).
//
// ¿Qué vamos a hacer aquí?
// - Probar todas las combinaciones posibles de (a,b):
//   00, 01, 10, 11
// - Imprimir resultados en consola.
// - Generar archivo de ondas .vcd para verlo en GTKWave.
//
//==============================================================

// Escala de tiempo de simulación:
// `timescale <unidad>/<precisión>
// 1ns/1ps significa:
// - 1 unidad de delay (#1) = 1 nanosegundo
// - precisión interna = 1 picosegundo
`timescale 1ns/1ps

module tb_and_gate;

    //==========================================================
    // Declaración de señales para el testbench
    //==========================================================
    //
    // En un testbench, las entradas al DUT normalmente se definen
    // como "reg" porque las vamos a asignar en un bloque "initial".
    //
    // Nota: en Verilog clásico, "reg" NO significa "registro físico";
    // significa "variable asignable proceduralmente".
    reg a;
    reg b;

    // La salida del DUT suele ser "wire" porque viene manejada por el DUT.
    wire y;

    //==========================================================
    // Instanciación del DUT (Device Under Test)
    //==========================================================
    // Aquí conectamos el módulo real que queremos probar.
    // .a(a) significa: puerto "a" del DUT se conecta a la señal "a" del TB.
    and_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

    //==========================================================
    // Bloque de simulación principal
    //==========================================================
    initial begin
        // 1) Configurar salida de ondas (VCD)
        //    Esto permite abrir y ver señales en GTKWave.
        $dumpfile("and_gate.vcd");     // nombre del archivo de ondas
        $dumpvars(0, tb_and_gate);     // qué módulo/señales grabar

        // 2) Mostrar encabezado en consola
        $display("=======================================");
        $display(" Simulacion compuerta AND (2 entradas) ");
        $display("   tiempo(ns) | a b | y");
        $display("=======================================");

        // 3) Definir un 'monitor' que imprima cada vez que cambie algo
        //    $monitor se ejecuta automáticamente ante cambios en señales.
        $monitor("      %0t      | %b %b | %b", $time, a, b, y);

        //======================================================
        // 4) Estímulos: recorrer combinaciones
        //======================================================
        // Cada #10 significa "esperar 10 ns" antes de cambiar entradas.

        a = 0; b = 0;  // caso 00 -> y esperado 0
        #10;

        a = 0; b = 1;  // caso 01 -> y esperado 0
        #10;

        a = 1; b = 0;  // caso 10 -> y esperado 0
        #10;

        a = 1; b = 1;  // caso 11 -> y esperado 1
        #10;

        // 5) Finalizar simulación
        $display("=======================================");
        $display(" Fin de la simulacion");
        $display("=======================================");
        $finish;
    end

endmodule
