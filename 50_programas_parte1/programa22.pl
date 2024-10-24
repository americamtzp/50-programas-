% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica si
%              un número entero dado es primo.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% 
% class Program
% {
%     // Función que verifica si un número es primo en C#.
%     static bool IsPrime(int number)
%     {
%         if (number <= 1) return false;
%         if (number <= 3) return true; // 2 y 3 son primos
%         if (number % 2 == 0) return false; // Eliminar múltiplos de 2
% 
%         for (int i = 3; i * i <= number; i += 2)
%         {
%             if (number % i == 0)
%                 return false; // Si se encuentra un divisor
%         }
%         return true; // Si no se encontró ningún divisor
%     }
% 
%     static void Main()
%     {
%         int numero = 29; // Cambia este número para probar otros
%         bool esPrimo = IsPrime(numero);
% 
%         Console.WriteLine($"{numero} es primo: {esPrimo}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado is_prime/1 que verifica si un número entero dado es primo.

% Casos base: 2 y 3 son números primos.
is_prime(2).
is_prime(3).

% Caso recursivo: verifica si P es primo comprobando
% que no tiene factores además de 1 y P mismo.
is_prime(P) :- 
    P > 3, 
    P mod 2 =\= 0, 
    \+ has_factor(P, 3). % Utiliza \+ en lugar de \\+

% Predicado has_factor/2 que verifica si un número tiene factores.
% Un número N tiene un factor L si N es divisible por L.
has_factor(N, L) :- 
    N mod L =:= 0.

% Verifica si N tiene factores a partir de L.
has_factor(N, L) :- 
    L * L < N, 
    L2 is L + 2, 
    has_factor(N, L2).

% Ejemplo de uso:
% ?- is_prime(29).
% true.
% ----------------------------------------------
