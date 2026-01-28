`timescale 1ns / 1ps  // Define la unidad de tiempo y precisión

module or_gate_tb();

    // 1. Declarar señales para conectar con la compuerta
    // Las entradas del módulo se declaran como "reg" porque les daremos valores.
    reg tb_a;
    reg tb_b;
    // La salida se declara como "wire" porque solo la observaremos.
    wire tb_q;

    // 2. Instanciar el módulo (conectar el Testbench con or_gate)
    or_gate uut (
        .a(tb_a),
        .b(tb_b),
        .q(tb_q)
    );

    // 3. Proceso de estímulos
    initial begin
        $dumpfile("compuerta_or.vcd");
        $dumpvars(0, or_gate_tb);
        // Mostrar encabezado en la consola
        $display("A B | Q");
        $display("-----");

        // Caso 1: 00
        tb_a = 0; tb_b = 0;
        #10; // Esperar 10 unidades de tiempo
        $display("%b %b | %b", tb_a, tb_b, tb_q);

        // Caso 2: 01
        tb_a = 0; tb_b = 1;
        #10;
        $display("%b %b | %b", tb_a, tb_b, tb_q);

        // Caso 3: 10
        tb_a = 1; tb_b = 0;
        #10;
        $display("%b %b | %b", tb_a, tb_b, tb_q);

        // Caso 4: 11
        tb_a = 1; tb_b = 1;
        #10;
        $display("%b %b | %b", tb_a, tb_b, tb_q);

        // Finalizar simulación
        $finish;
    end

endmodule