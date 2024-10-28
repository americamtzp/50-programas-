% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que genera 
%              una lista de números primos en un
%              rango dado.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para determinar si un número es primo.
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
%     // Función para generar una lista de números primos en un rango dado.
%     static List<int> PrimeList(int low, int high)
%     {
%         List<int> primes = new List<int>();
%         for (int i = low; i <= high; i++)
%         {
%             if (IsPrime(i))
%             {
%                 primes.Add(i); // Agrega el número primo a la lista.
%             }
%         }
%         return primes;
%     }
% 
%     static void Main()
%     {
%         int low = 10;
%         int high = 50;
%         List<int> primes = PrimeList(low, high);
% 
%         Console.WriteLine("Números primos entre " + low + " y " + high + ": " + string.Join(", ", primes));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado is_prime(N) que determina si N es un número primo.
is_prime(2). % 2 es primo.
is_prime(N) :- 
    N > 2, 
    Max is floor(sqrt(N)), % Calcular la raíz cuadrada entera de N
    \+ (between(2, Max, X), N mod X =:= 0).

% Predicado prime_list(Low, High, Primes) que genera
% una lista de números primos en el rango dado.
prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Ejemplo de uso:
% ?- prime_list(10, 50, Primes).
% Primes = [11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47].
% ----------------------------------------------
