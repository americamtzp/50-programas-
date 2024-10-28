% =============================================== 
% Autor: Juan Pérez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que inserta un
%              elemento en una lista en una posición 
%              dada. Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para insertar un elemento en una lista en una posición dada.
%     static List<T> InsertAt<T>(List<T> list, T element, int position)
%     {
%         if (position <= 0 || position > list.Count + 1)
%             throw new ArgumentException("La posición debe ser mayor que 0 y menor o igual que el tamaño de la lista.");
%         
%         list.Insert(position - 1, element);  // Inserta el elemento en la posición dada.
%         return list;
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4 };
%         int elemento = 99;
%         int posicion = 3;
% 
%         List<int> nuevaLista = InsertAt(lista, elemento, posicion);
%         Console.WriteLine("Lista después de la inserción: " + string.Join(", ", nuevaLista));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado insert_at(Element, List, Position, ResultList) 
% que inserta un Element en la posición Position de la lista List,
% devolviendo el resultado en ResultList.

% Caso base: inserta el elemento en la posición 1.
insert_at(X, L, 1, [X|L]).

% Caso recursivo: recorre la lista hasta encontrar la posición correcta.
insert_at(X, [H|T], K, [H|R]) :-
    K > 1,                   % Asegura que K sea mayor que 1.
    K1 is K - 1,             % Decrementa K para acercarse a la posición.
    insert_at(X, T, K1, R).  % Inserta el elemento en la posición correcta.

% Ejemplo de uso:
% ?- insert_at(99, [1, 2, 3, 4], 3, Result).
% Result = [1, 2, 99, 3, 4].
% ----------------------------------------------
