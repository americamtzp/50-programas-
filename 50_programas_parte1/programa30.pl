% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que encuentra
%              dos números primos que sumen un número
%              par dado, de acuerdo con la conjetura
%              de Goldbach.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Método que determina si un número es primo.
%     static bool IsPrime(int number)
%     {
%         if (number <= 1) return false;
%         for (int i = 2; i <= Math.Sqrt(number); i++)
%         {
%             if (number % i == 0) return false;
%         }
%         return true;
%     }
% 
%     // Método que encuentra dos números primos que sumen a un número par.
%     static Tuple<int, int> Goldbach(int n)
%     {
%         if (n <= 2 || n % 2 != 0)
%             throw new ArgumentException("El número debe ser un par mayor que 2.");
% 
%         for (int p1 = 2; p1 <= n / 2; p1++)
%         {
%             if (IsPrime(p1))
%             {
%                 int p2 = n - p1;
%                 if (IsPrime(p2))
%                 {
%                     return Tuple.Create(p1, p2); // Retorna los dos primos.
%                 }
%             }
%         }
%         throw new Exception("No se encontraron números primos que sumen a " + n);
%     }
% 
%     static void Main()
%     {
%         int n = 28; // Número par a evaluar.
%         var primos = Goldbach(n);
%         Console.WriteLine($"Los números primos que suman {n} son: {primos.Item1} y {primos.Item2}");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado is_prime(N) que determina si N es primo.
is_prime(2).
is_prime(N) :- 
    N > 2, 
    Floor is floor(sqrt(N)),  % Calcular la raíz cuadrada antes de usarla
    \+ (between(2, Floor, I), N mod I =:= 0).

% Predicado prime_list(Low, High, Primes) que genera una lista de números primos 
% entre Low y High (inclusive).
prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Predicado goldbach(N, [P1, P2]) que encuentra
% dos números primos que suman N según la conjetura de Goldbach.

% Caso base: N debe ser mayor que 2 y par.
goldbach(N, [P1, P2]) :- 
    N > 2, 
    N mod 2 =:= 0, 
    prime_list(2, N, Primes), 
    member(P1, Primes), 
    P2 is N - P1, 
    is_prime(P2).

% Ejemplo de uso:
% ?- goldbach(28, [P1, P2]).
% P1 = 5, P2 = 23 ; P1 = 11, P2 = 17 ; P1 = 17, P2 = 11 ; P1 = 23, P2 = 5.
% ----------------------------------------------
