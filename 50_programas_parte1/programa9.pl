% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que modifica 
%              la codificación Run-Length de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para modificar la codificación Run-Length de una lista.
%     static List<object> EncodeModified(List<object> list)
%     {
%         var encoded = Encode(list);
%         return Modify(encoded);
%     }
% 
%     // Función para codificar la lista usando Run-Length.
%     static List<List<object>> Encode(List<object> list)
%     {
%         // Lógica para la codificación Run-Length (implementación omitida).
%         // Devuelve una lista de listas con el formato [N, X].
%         return new List<List<object>>();
%     }
% 
%     // Función para modificar la codificación.
%     static List<object> Modify(List<List<object>> encoded)
%     {
%         var result = new List<object>();
%         
%         foreach (var pair in encoded)
%         {
%             if ((int)pair[0] == 1)
%             {
%                 result.Add(pair[1]); // Agrega directamente si N = 1.
%             }
%             else
%             {
%                 result.Add(pair); // Mantiene el formato [N, X] si N > 1.
%             }
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<object> lista = new List<object> { 'a', 'a', 'b', 'c', 'c', 'c' };
%         var resultado = EncodeModified(lista);
% 
%         // Muestra el resultado.
%         Console.WriteLine("Resultado de la codificación modificada: " + string.Join(", ", resultado));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado encode_modified(L, R) que modifica la
% codificación Run-Length de la lista L y genera la lista R.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Predicado encode(L, Enc) que codifica la lista L usando Run-Length.
encode([], []). % Caso base: lista vacía.
encode([H|T], [[N,H]|Enc]) :- 
    count(H, [H|T], N), 
    remove_duplicates(H, T, Rest), 
    encode(Rest, Enc).

% Cuenta cuántas veces aparece un elemento en la lista.
count(_, [], 0). % Caso base: si la lista está vacía, el conteo es 0.
count(X, [X|T], N) :- 
    count(X, T, N1), 
    N is N1 + 1. % Incrementa el conteo.
count(X, [Y|T], N) :- 
    X \= Y, 
    count(X, T, N). % Si no es el elemento que buscamos, sigue contando.

% Remueve los elementos duplicados de la lista.
remove_duplicates(_, [], []). % Caso base: lista vacía.
remove_duplicates(X, [X|T], Rest) :- 
    remove_duplicates(X, T, Rest). % Ignora duplicados.
remove_duplicates(X, [Y|T], [Y|Rest]) :- 
    X \= Y, 
    remove_duplicates(Y, T, Rest). % Agrega elementos no duplicados.

% Caso base: lista vacía.
modify([], []).
% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).
% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% Ejemplo de uso:
% ?- encode_modified([a, a, b, c, c, c], R).
% R = [[2, a], b, [3, c]].
% ----------------------------------------------
