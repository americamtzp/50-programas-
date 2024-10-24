% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que ordena una
%              lista de listas de acuerdo con la 
%              longitud de las sublistas.
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
%     // Función para ordenar una lista de listas según la longitud de las sublistas en C#.
%     static List<List<T>> LSort<T>(List<List<T>> listOfLists)
%     {
%         // Ordena las listas por longitud usando LINQ
%         return listOfLists.OrderBy(subList => subList.Count).ToList();
%     }
% 
%     static void Main()
%     {
%         // Ejemplo de listas de listas
%         var listas = new List<List<char>>
%         {
%             new List<char> { 'a' },
%             new List<char> { 'b', 'c' },
%             new List<char> { 'd', 'e', 'f' },
%             new List<char> { 'g' }
%         };
% 
%         var listasOrdenadas = LSort(listas);
% 
%         Console.WriteLine("Listas ordenadas por longitud:");
%         foreach (var sublist in listasOrdenadas)
%         {
%             Console.WriteLine(string.Join(", ", sublist));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado lsort(L, S) que ordena la lista de listas L
% de acuerdo con la longitud de las sublistas y 
% devuelve la lista ordenada en S.

lsort(L, S) :-
    map_list_to_pairs(length, L, P),  % Crea pares de longitud y sublistas.
    keysort(P, SP),                    % Ordena los pares por la longitud.
    pairs_values(SP, S).               % Extrae los valores (sublistas) ordenados.

% Ejemplo de uso:
% ?- lsort([[a], [b, c], [d, e, f], [g]], S).
% S = [[a], [g], [b, c], [d, e, f]].
% ----------------------------------------------
