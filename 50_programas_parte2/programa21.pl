% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que ordena una
%              lista de listas de acuerdo con la 
%              frecuencia de la longitud de las 
%              sublistas.
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
%     // Función que ordena una lista de listas según la frecuencia de la longitud de las sublistas en C#.
%     static List<List<T>> LengthFrequency<T>(List<List<T>> listOfLists)
%     {
%         // Agrupa las sublistas por su longitud y cuenta las frecuencias
%         var frequency = listOfLists
%             .GroupBy(sublist => sublist.Count)
%             .OrderBy(group => group.Key) // Ordena por la longitud
%             .ToList();
% 
%         // Devuelve una lista de listas ordenadas
%         return frequency.SelectMany(group => group).ToList();
%     }
% 
%     static void Main()
%     {
%         List<List<int>> listaDeListas = new List<List<int>>
%         {
%             new List<int> { 1, 2 },
%             new List<int> { 3 },
%             new List<int> { 4, 5, 6 },
%             new List<int> { 7, 8 },
%             new List<int> { 9 }
%         };
% 
%         var listaOrdenada = LengthFrequency(listaDeListas);
% 
%         Console.WriteLine("Lista ordenada según la frecuencia de la longitud:");
%         foreach (var sublist in listaOrdenada)
%         {
%             Console.WriteLine($"[{string.Join(", ", sublist)}]");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado length_frequency(List, Frequency) que ordena una lista de listas
% de acuerdo con la frecuencia de la longitud de las sublistas.

length_frequency(L, F) :- 
    map_list_to_pairs(length, L, P),  % Mapea la longitud de cada sublista.
    msort(P, SP),                      % Ordena las parejas por longitud.
    encode(SP, F).                     % Codifica la frecuencia.

% Predicado encode/2 que transforma la lista de pares (Longitud-Frecuencia) en una lista de listas.
encode([], []).
encode([Length-List|Pairs], [[Length, List]|EncodedPairs]) :-
    encode(Pairs, EncodedPairs).

% Ejemplo de uso:
% ?- length_frequency([[1, 2], [3], [4, 5, 6], [7, 8], [9]], F).
% F = [[1, [3]], [2, [1, 2]], [3, [4, 5, 6]]].
% ----------------------------------------------
