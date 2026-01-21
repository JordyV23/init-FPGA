module hola (
    input wire a, // Signal de entrada de tipo wire (Se utilia para vables)
    output wire y // Es una salida de tipo wire, es un cable que transporta la señal de salida
);

    // Asignación continua: lo que pase en 'a' se refleja en 'y'
    assign y = a;

endmodule
