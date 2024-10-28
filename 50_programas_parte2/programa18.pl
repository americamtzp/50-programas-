% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que genera todas 
%              las combinaciones de K elementos 
%              seleccionados de una lista dada.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función recursiva para generar combinaciones de K elementos
%     static List<List<T>> Combination<T>(int K, List<T> list)
%     {
%         var result = new List<List<T>>();
%         
%         // Caso base: Si K es 0, devuelve una lista vacía como combinación
%         if (K == 0)
%         {
%             result.Add(new List<T>());
%             return result;
%         }
% 
%         // Caso recursivo: recorrer la lista y generar combinaciones
%         for (int i = 0; i < list.Count; i++)
%         {
%             T head = list[i];
%             var tailCombinations = Combination(K - 1, list.GetRange(i + 1, list.Count - (i + 1)));
%             
%             foreach (var comb in tailCombinations)
%             {
%                 comb.Insert(0, head);  // Añadir el elemento en la cabeza
%                 result.Add(comb);
%             }
%         }
%         
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 };
%         int K = 2;
%         var combinaciones = Combination(K, lista);
% 
%         Console.WriteLine("Combinaciones de " + K + " elementos:");
%         foreach (var comb in combinaciones)
%         {
%             Console.WriteLine(string.Join(", ", comb));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado combination(K, List, Comb) que genera 
% todas las combinaciones de K elementos de la lista List.

% Caso base: si K es 0, la combinación es la lista vacía.
combination(0, _, []).

% Caso recursivo 1: selecciona el primer elemento y reduce K.
combination(K, [H|T], [H|Comb]) :- 
    K > 0, 
    K1 is K - 1, 
    combination(K1, T, Comb).

% Caso recursivo 2: ignora el primer elemento y busca en el resto de la lista.
combination(K, [_|T], Comb) :- 
    K > 0, 
    combination(K, T, Comb).

% Ejemplo de uso:
% ?- combination(2, [1, 2, 3, 4], Comb).
% Comb = [1, 2] ;
% Comb = [1, 3] ;
% Comb = [1, 4] ;
% Comb = [2, 3] ;
% Comb = [2, 4] ;
% Comb = [3, 4].
% ----------------------------------------------
