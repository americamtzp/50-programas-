% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que calcula la 
%              función totiente de Euler usando
%              los factores primos con multiplicidad 
%              para mejorar la eficiencia.
% ===============================================

% -------- Código en Prolog --------------------
% Calcula la función totiente usando los factores primos con multiplicidad.

% Llama al predicado prime_factors_mult para obtener los factores primos y sus multiplicidades.
totient_improved(N, Phi) :-
    prime_factors_mult(N, F),
    totient_phi(F, Phi).

% Caso base: cuando no hay más factores, el valor de la función totiente es 1.
totient_phi([], 1).

% Caso recursivo: aplica la fórmula para calcular la función totiente usando los factores primos.
totient_phi([[P, M]|T], Phi) :-
    totient_phi(T, Phi1),
    Phi is Phi1 * (P - 1) * P ** (M - 1).

% -----------------------------
% Implementación de prime_factors_mult/2
% -----------------------------

% Descompone un número en factores primos con su multiplicidad.
prime_factors_mult(N, F) :- 
    prime_factors(N, 2, F).

% Caso base: cuando el número es 1, no hay más factores.
prime_factors(1, _, []).

% Si el número es divisible por el divisor actual, cuenta las divisiones consecutivas.
prime_factors(N, D, [[D, M]|Fs]) :-
    N > 1,
    divisible_count(N, D, M, N1),
    M > 0, % El factor D se encontró M veces
    prime_factors(N1, D + 1, Fs).

% Si el divisor no divide el número, intenta con el siguiente divisor.
prime_factors(N, D, Fs) :-
    N > 1,
    N mod D =\= 0,
    D1 is D + 1,
    prime_factors(N, D1, Fs).

% -----------------------------
% Auxiliar: cuenta cuántas veces un número es divisible por un divisor.
% divisible_count(N, D, Count, N1) unifica Count con el número de veces que N es divisible por D
% y devuelve N1 como el resultado de dividir N por D esas veces.
divisible_count(N, D, Count, N1) :-
    divisible_count(N, D, 0, Count, N1).

divisible_count(N, D, Acc, Count, N1) :-
    N mod D =:= 0, !,
    N2 is N // D,
    Acc1 is Acc + 1,
    divisible_count(N2, D, Acc1, Count, N1).
divisible_count(N, _, Count, Count, N).

% Ejemplo de uso:
% ?- totient_improved(36, Phi).
% Phi = 12.
% ----------------------------------------------
