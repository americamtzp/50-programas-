% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que elimina 
%              duplicados consecutivos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para eliminar duplicados consecutivos de una lista en C#.
%     static List<T> Compress<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             return new List<T>(); // Devuelve una lista vacía.
% 
%         List<T> result = new List<T> { list[0] }; // Agrega el primer elemento.
%         
%         for (int i = 1; i < list.Count; i++)
%         {
%             // Solo agrega el elemento si es diferente al último agregado.
%             if (!list[i].Equals(result[result.Count - 1]))
%             {
%                 result.Add(list[i]);
%             }
%         }
% 
%         return result; // Devuelve la lista sin duplicados consecutivos.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 1, 2, 2, 3, 3, 3, 4 };
%         List<int> resultado = Compress(lista);
% 
%         Console.WriteLine("Lista sin duplicados consecutivos: " + string.Join(", ", resultado));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado compress(List, Result) que elimina
% duplicados consecutivos de la lista List.

% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- X \= Y, compress([Y|T], R).

% Ejemplo de uso:
% ?- compress([1, 1, 2, 2, 3, 3, 3, 4], R).
% R = [1, 2, 3, 4].
% ----------------------------------------------
