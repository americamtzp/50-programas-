% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que duplica los
%              elementos de una lista un número dado
%              de veces. Se incluye una versión 
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que duplica un elemento N veces.
%     static List<T> Duplicate<T>(T element, int N)
%     {
%         List<T> result = new List<T>();
%         
%         // Añade el elemento a la lista N veces.
%         for (int i = 0; i < N; i++)
%         {
%             result.Add(element);
%         }
%         
%         return result;
%     }

%     // Función que duplica todos los elementos de una lista un número dado de veces.
%     static List<T> Dupli<T>(List<T> list, int N)
%     {
%         List<T> result = new List<T>();
%         
%         // Itera sobre cada elemento de la lista original.
%         foreach (T element in list)
%         {
%             // Duplica el elemento y lo añade a la lista resultado.
%             result.AddRange(Duplicate(element, N));
%         }
%         
%         return result;
%     }

%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3 };
%         List<int> resultado = Dupli(lista, 2);
%         
%         // Muestra la lista duplicada.
%         Console.WriteLine("Lista duplicada: " + string.Join(", ", resultado));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado dupli(Lista, N, Resultado) que duplica
% los elementos de la lista un número dado de veces.

% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).

% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- 
    duplicate(H, N, D),    % Duplicar el primer elemento H N veces.
    dupli(T, N, R1),       % Recursivamente duplicar el resto de la lista.
    append(D, R1, R).      % Unir las duplicaciones en el resultado final.

% Predicado que crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).

duplicate(X, N, [X|R]) :-
    N > 0,
    N1 is N - 1,
    duplicate(X, N1, R).

% Ejemplo de uso:
% ?- dupli([1, 2, 3], 2, R).
% R = [1, 1, 2, 2, 3, 3].
% ----------------------------------------------
