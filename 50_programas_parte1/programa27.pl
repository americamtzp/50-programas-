% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              los factores primos de un número
%              con su multiplicidad.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que devuelve los factores primos con su multiplicidad.
%     static List<(int, int)> PrimeFactorsMult(int n)
%     {
%         List<int> factors = PrimeFactors(n);
%         return Encode(factors);
%     }
% 
%     // Función que calcula los factores primos de un número.
%     static List<int> PrimeFactors(int n)
%     {
%         List<int> factors = new List<int>();
%         for (int i = 2; i <= n; i++)
%         {
%             while (n % i == 0)
%             {
%                 factors.Add(i);
%                 n /= i;
%             }
%         }
%         return factors;
%     }
% 
%     // Función que codifica la lista de factores primos con su multiplicidad.
%     static List<(int, int)> Encode(List<int> factors)
%     {
%         List<(int, int)> result = new List<(int, int)>();
%         foreach (int factor in factors)
%         {
%             if (result.Count > 0 && result[^1].Item1 == factor)
%             {
%                 result[^1] = (factor, result[^1].Item2 + 1);
%             }
%             else
%             {
%                 result.Add((factor, 1));
%             }
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         int n = 315;
%         List<(int, int)> factoresConMultiplicidad = PrimeFactorsMult(n);
% 
%         Console.WriteLine("Factores primos con multiplicidad de " + n + ":");
%         foreach (var factor in factoresConMultiplicidad)
%         {
%             Console.WriteLine($"{factor.Item1}^{factor.Item2}");
%         }
%     }
% }

% Ejemplo de uso:
% // Resultado esperado:
% // Factores primos con multiplicidad de 315:
% // 3^2
% // 5^1
% // 7^1
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado prime_factors_mult(N, L) que determina
% los factores primos con su multiplicidad de N.

% Calcula los factores primos de N.
prime_factors_mult(N, L) :-
    prime_factors(N, F),      % Obtiene la lista de factores primos.
    encode(F, L).             % Codifica la lista con su multiplicidad.

% Ejemplo de uso:
% ?- prime_factors_mult(315, L).
% L = [[3, 2], [5, 1], [7, 1]].

% Predicado que obtiene la lista de factores primos.
prime_factors(N, F) :- prime_factors(N, 2, F).

prime_factors(1, _, []) :- !.
prime_factors(N, D, [D|Fs]) :-
    N mod D =:= 0, !,
    N1 is N // D,
    prime_factors(N1, D, Fs).
prime_factors(N, D, Fs) :-
    D2 is D + 1,
    prime_factors(N, D2, Fs).

% Predicado que codifica la lista de factores primos con su multiplicidad.
encode([], []).
encode([H|T], [[H, Count]|T1]) :-
    count(H, [H|T], Count),
    remove(H, T, T2),
    encode(T2, T1).

% Predicado auxiliar que cuenta cuántas veces aparece un elemento en una lista.
count(_, [], 0).
count(X, [X|T], N) :-
    count(X, T, N1),
    N is N1 + 1.
count(X, [_|T], N) :-
    count(X, T, N).

% Predicado auxiliar que elimina todas las apariciones de un elemento en una lista.
remove(_, [], []).
remove(X, [X|T], T1) :-
    remove(X, T, T1).
remove(X, [H|T], [H|T1]) :-
    remove(X, T, T1).

% Ejemplo de uso:
% ?- prime_factors_mult(315, L).
% L = [[3, 2], [5, 1], [7, 1]].
% ----------------------------------------------
