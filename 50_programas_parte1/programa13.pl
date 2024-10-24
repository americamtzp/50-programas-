% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae una porción
%              de una lista, dado un rango de índices I y K.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que extrae una porción de la lista entre dos índices (inclusivo).
%     static List<T> Slice<T>(List<T> list, int startIndex, int endIndex)
%     {
%         if (list == null || startIndex < 1 || endIndex < 1 || startIndex > endIndex || endIndex > list.Count)
%             throw new ArgumentException("Índices no válidos.");

%         // Devuelve una sublista desde startIndex-1 hasta endIndex.
%         return list.GetRange(startIndex - 1, endIndex - startIndex + 1);
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd', 'e' };
%         List<char> sublista = Slice(lista, 2, 4); // Extrae desde el índice 2 hasta el 4
% 
%         Console.WriteLine("Porción extraída: " + string.Join(", ", sublista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado slice(List, I, K, Result) que extrae una porción
% de la lista List desde el índice I hasta el índice K.

% Caso base: cuando los índices I y K son iguales, la porción es el elemento en la posición I.
slice([H|_], 1, 1, [H]).

% Caso recursivo 1: cuando I es 1 y K > 1, continúa construyendo la porción hasta llegar a K.
slice([H|T], 1, K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    slice(T, 1, K1, R).

% Caso recursivo 2: cuando I > 1, ignora los primeros elementos hasta llegar al índice I.
slice([_|T], I, K, R) :-
    I > 1,
    I1 is I - 1,
    K1 is K - 1,
    slice(T, I1, K1, R).

% Ejemplo de uso:
% ?- slice([a, b, c, d, e], 2, 4, Result).
% Result = [b, c, d].
% ----------------------------------------------
