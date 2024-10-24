% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que divide una lista
%              en dos partes. La longitud de la primera
%              parte está dada por el segundo argumento.
%              Se incluye una versión comentada en C# 
%              para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que divide una lista en dos partes en C#.
%     static void Split<T>(List<T> list, int n, out List<T> firstPart, out List<T> secondPart)
%     {
%         if (n < 0 || n > list.Count)
%             throw new ArgumentException("El segundo argumento debe estar entre 0 y el tamaño de la lista.");
%         
%         // La primera parte contiene los primeros n elementos.
%         firstPart = list.GetRange(0, n);
%         // La segunda parte contiene los elementos restantes.
%         secondPart = list.GetRange(n, list.Count - n);
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%         Split(lista, 2, out List<int> primeraParte, out List<int> segundaParte);
% 
%         Console.WriteLine("Primera parte: " + string.Join(", ", primeraParte));
%         Console.WriteLine("Segunda parte: " + string.Join(", ", segundaParte));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado split(L, N, L1, L2) que divide la lista L
% en dos partes, donde L1 tiene los primeros N elementos
% y L2 contiene el resto de los elementos.

% Caso base: cuando N es 0, la primera parte es vacía y la segunda es la lista original.
split(L, 0, [], L).

% Caso recursivo: divide la lista tomando el primer elemento en L1
% y continúa dividiendo el resto de la lista.
split([H|T], N, [H|L1], L2) :-
    N > 0,
    N1 is N - 1,
    split(T, N1, L1, L2).

% Ejemplo de uso:
% ?- split([1, 2, 3, 4, 5], 2, L1, L2).
% L1 = [1, 2],
% L2 = [3, 4, 5].
% ----------------------------------------------
