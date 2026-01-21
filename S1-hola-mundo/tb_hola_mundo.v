// Un testbench simula el comportamiento del modulo hola_mundo.v

// Funciona para generar entradas (estimulos) y observar las salidas

// Este testbench:
// 1) Instancia el modulo hola (DTU = Device Under Test)
// 2) Genera señales de entrada para el modulo hola (cada 10 ns)
// 3) Genera el archivo dump.vcd

//  `timescale define la unidad de tiempo y la precision
//  `timescale 1ns / 1ps significa que la unidad de tiempo es 1 nanosegundo

`timescale 1ns / 1ps

module tb_hola_mundo;

    // Señales para conectar al DUT
    reg a; // Señal de entrada de tipo reg (Se utiliza para variables en testbenches)
    wire y; // Señal de salida de tipo wire

    // Instancia del DUT (Device Under Test)
    hola dut (
        .a(a),
        .y(y)
    );

    // Generación de señales de entrada
    initial begin
        // Inicialización
        a = 0;

        // Cambiar la señal 'a' cada 10 ns
        forever begin
            #10 a = ~a; // Invertir el valor de 'a' cada 10 ns
        end
    end

    // Generación del archivo VCD para simulación
    initial begin
        $dumpfile("tb_hola_mundo.vcd"); // Nombre del archivo VCD
        $dumpvars(0, tb_hola_mundo);    // Volcar todas las variables del testbench
        #100;                            // Simular por 100 ns
        $finish;                         // Finalizar la simulación
    end

endmodule