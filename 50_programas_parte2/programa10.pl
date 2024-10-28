% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que duplica 
%              los elementos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que duplica los elementos de una lista en C#.
%     static List<T> Dupli<T>(List<T> list)
%     {
%         List<T> duplicatedList = new List<T>();
% 
%         // Recorre la lista y añade dos veces cada elemento
%         foreach (T item in list)
%         {
%             duplicatedList.Add(item); // Añade el elemento una vez
%             duplicatedList.Add(item); // Añade el mismo elemento otra vez
%         }
% 
%         return duplicatedList;
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 };
%         List<int> duplicada = Dupli(lista);
% 
%         Console.WriteLine("Lista duplicada: " + string.Join(", ", duplicada));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(List, DuplicatedList) que duplica
% los elementos de List en DuplicatedList.

% Caso base: la lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto de la lista.
dupli([H|T], [H,H|R]) :- 
    dupli(T, R).

% Ejemplo de uso:
% ?- dupli([1, 2, 3], X).
% X = [1, 1, 2, 2, 3, 3].
% ----------------------------------------------
