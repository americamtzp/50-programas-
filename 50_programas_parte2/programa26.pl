% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que encuentra 
%              los factores primos de un número entero positivo.
% ===============================================

% -------- Código en Prolog --------------------
% Predicado prime_factors(N, L) que determina los factores primos
% del número entero positivo N, y los devuelve en la lista L.

% Definición del predicado prime_factors/2 que llama al predicado prime_factors/3.
prime_factors(N, L) :- 
    N > 1, 
    prime_factors(N, 2, L).

% Caso base: cuando N es 1, no hay más factores primos.
prime_factors(1, _, []).

% Si N es divisible por F, agregar F a la lista de factores y continuar con N dividido por F.
prime_factors(N, F, [F|L]) :- 
    N > 1, 
    0 is N mod F, 
    N1 is N // F, 
    prime_factors(N1, F, L).

% Si N no es divisible por F y F² es menor que N, buscar el siguiente factor.
prime_factors(N, F, L) :- 
    N > 1, 
    F * F < N, 
    next_factor(F, F1), 
    prime_factors(N, F1, L).

% Si el cuadrado del factor actual ya es mayor que N, entonces N es primo y se agrega a la lista.
prime_factors(N, F, [N]) :- 
    F * F >= N, 
    N > 1.

% Regla para encontrar el siguiente factor después de 2 (que será 3).
next_factor(2, 3).

% Para factores mayores que 2, incrementar en 2 (solo probar con números impares).
next_factor(F, F1) :- 
    F > 2, 
    F1 is F + 2.

% Ejemplo de uso:
% ?- prime_factors(315, L).
% L = [3, 3, 5, 7].
