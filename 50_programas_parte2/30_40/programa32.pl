% ===============================================
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que define los 
%              operadores lógicos básicos y genera
%              las tablas de verdad para AND, OR,
%              NAND, NOR, XOR, IMPLICACIÓN y
%              EQUIVALENCIA.
% ===============================================

% -------- Código en C# ------------
% using System;
% 
% class Program
% {
%     static void Main()
%     {
%         Console.WriteLine("Tabla de verdad para AND:");
%         GenerarTablaAnd();
% 
%         Console.WriteLine("\nTabla de verdad para OR:");
%         GenerarTablaOr();
% 
%         Console.WriteLine("\nTabla de verdad para NAND:");
%         GenerarTablaNand();
% 
%         Console.WriteLine("\nTabla de verdad para NOR:");
%         GenerarTablaNor();
% 
%         Console.WriteLine("\nTabla de verdad para XOR:");
%         GenerarTablaXor();
% 
%         Console.WriteLine("\nTabla de verdad para Implicación:");
%         GenerarTablaImplicacion();
% 
%         Console.WriteLine("\nTabla de verdad para Equivalencia:");
%         GenerarTablaEquivalencia();
%     }
% 
%     // Operador AND
%     static bool And(bool A, bool B) => A && B;
% 
%     // Operador OR
%     static bool Or(bool A, bool B) => A || B;
% 
%     // Operador NAND
%     static bool Nand(bool A, bool B) => !(A && B);
% 
%     // Operador NOR
%     static bool Nor(bool A, bool B) => !(A || B);
% 
%     // Operador XOR
%     static bool Xor(bool A, bool B) => A ^ B;
% 
%     // Operador Implicación
%     static bool Implicacion(bool A, bool B) => !A || B;
% 
%     // Operador Equivalencia
%     static bool Equivalencia(bool A, bool B) => A == B;
% 
%     // Generación de tabla de verdad para AND
%     static void GenerarTablaAnd()
%     {
%         Console.WriteLine("A   B   Resultado");
%         Console.WriteLine($"T   T   {And(true, true)}");
%         Console.WriteLine($"T   F   {And(true, false)}");
%         Console.WriteLine($"F   T   {And(false, true)}");
%         Console.WriteLine($"F   F   {And(false, false)}");
%     }
% 
%     // Generación de tabla de verdad para OR
%     static void GenerarTablaOr()
%     {
%         Console.WriteLine("A   B   Resultado");
%         Console.WriteLine($"T   T   {Or(true, true)}");
%         Console.WriteLine($"T   F   {Or(true, false)}");
%         Console.WriteLine($"F   T   {Or(false, true)}");
%         Console.WriteLine($"F   F   {Or(false, false)}");
%     }
% 
%     // Generación de tabla de verdad para NAND
%     static void GenerarTablaNand()
%     {
%         Console.WriteLine("A   B   Resultado");
%         Console.WriteLine($"T   T   {Nand(true, true)}");
%         Console.WriteLine($"T   F   {Nand(true, false)}");
%         Console.WriteLine($"F   T   {Nand(false, true)}");
%         Console.WriteLine($"F   F   {Nand(false, false)}");
%     }
% 
%     // Generación de tabla de verdad para NOR
%     static void GenerarTablaNor()
%     {
%         Console.WriteLine("A   B   Resultado");
%         Console.WriteLine($"T   T   {Nor(true, true)}");
%         Console.WriteLine($"T   F   {Nor(true, false)}");
%         Console.WriteLine($"F   T   {Nor(false, true)}");
%         Console.WriteLine($"F   F   {Nor(false, false)}");
%     }
% 
%     // Generación de tabla de verdad para XOR
%     static void GenerarTablaXor()
%     {
%         Console.WriteLine("A   B   Resultado");
%         Console.WriteLine($"T   T   {Xor(true, true)}");
%         Console.WriteLine($"T   F   {Xor(true, false)}");
%         Console.WriteLine($"F   T   {Xor(false, true)}");
%         Console.WriteLine($"F   F   {Xor(false, false)}");
%     }
% 
%     // Generación de tabla de verdad para Implicación
%     static void GenerarTablaImplicacion()
%     {
%         Console.WriteLine("A   B   Resultado");
%         Console.WriteLine($"T   T   {Implicacion(true, true)}");
%         Console.WriteLine($"T   F   {Implicacion(true, false)}");
%         Console.WriteLine($"F   T   {Implicacion(false, true)}");
%         Console.WriteLine($"F   F   {Implicacion(false, false)}");
%     }
% 
%     // Generación de tabla de verdad para Equivalencia
%     static void GenerarTablaEquivalencia()
%     {
%         Console.WriteLine("A   B   Resultado");
%         Console.WriteLine($"T   T   {Equivalencia(true, true)}");
%         Console.WriteLine($"T   F   {Equivalencia(true, false)}");
%         Console.WriteLine($"F   T   {Equivalencia(false, true)}");
%         Console.WriteLine($"F   F   {Equivalencia(false, false)}");
%     }
% }
% ----------------------------------------------

% -------- Definición de Operadores Lógicos -----

% AND: Verdadero si ambos son verdaderos.
and(A, B) :- A, B.

% OR: Verdadero si al menos uno es verdadero.
or(A, _) :- A.
or(_, B) :- B.

% NAND: Verdadero si no ambos son verdaderos.
nand(A, B) :- \+ (A, B).

% NOR: Verdadero si ninguno es verdadero.
nor(A, B) :- \+ (A; B).

% XOR: Verdadero si solo uno es verdadero.
xor(A, B) :- A, \+ B; \+ A, B.

% IMPLICACIÓN: Verdadero si A implica B (A -> B).
impl(A, B) :- \+ A; B.

% EQUIVALENCIA: Verdadero si ambos tienen el mismo valor.
equ(A, B) :- A, B; \+ A, \+ B.

% Ejemplo de uso para probar los operadores:
% ?- and(true, false).  % Resultado: false
% ?- or(false, true).   % Resultado: true
% ?- nand(true, true).  % Resultado: false
% ?- nor(false, true).   % Resultado: false
% ?- xor(true, false).   % Resultado: true
% ?- impl(false, true).  % Resultado: true
% ?- equ(true, true).    % Resultado: true
% ----------------------------------------------
