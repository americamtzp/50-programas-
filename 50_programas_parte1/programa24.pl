% =============================================== 
% Autor: America Martinez Perez
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              si dos números son coprimos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función que calcula el MCD (Máximo Común Divisor) de dos números.
%     static int GCD(int a, int b)
%     {
%         // Algoritmo de Euclides para el MCD.
%         while (b != 0)
%         {
%             int temp = b;
%             b = a % b;
%             a = temp;
%         }
%         return a;
%     }
% 
%     // Función que determina si dos números son coprimos (si el MCD es 1).
%     static bool AreCoprime(int x, int y)
%     {
%         return GCD(x, y) == 1;
%     }
% 
%     static void Main()
%     {
%         int num1 = 15;
%         int num2 = 28;
% 
%         if (AreCoprime(num1, num2))
%         {
%             Console.WriteLine($"{num1} y {num2} son coprimos.");
%         }
%         else
%         {
%             Console.WriteLine($"{num1} y {num2} no son coprimos.");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado coprime(X, Y) que determina si dos
% números X e Y son coprimos.

% Definición del algoritmo de Euclides para calcular el MCD.
gcd(X, 0, X) :- !.
gcd(X, Y, GCD) :-
    Y > 0,
    R is X mod Y,
    gcd(Y, R, GCD).

% Dos números son coprimos si su MCD es 1.
coprime(X, Y) :- gcd(X, Y, 1).

% Ejemplo de uso:
% ?- coprime(15, 28).
% true.
% ----------------------------------------------
