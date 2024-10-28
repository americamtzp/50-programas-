% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el k-ésimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para encontrar el k-ésimo elemento de una lista en C#.
%     static T ElementAt<T>(List<T> list, int k)
%     {
%         if (list == null || k < 1 || k > list.Count)
%             throw new ArgumentException("Índice fuera de rango o lista no válida.");
%         
%         return list[k - 1]; // Devuelve el elemento en la posición k (1-based).
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'd' };
%         int k = 3;
%         char elementoK = ElementAt(lista, k);
% 
%         Console.WriteLine($"El {k}-ésimo elemento es: " + elementoK);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, K) que determina el
% k-ésimo elemento X de la lista List. El índice K
% debe ser mayor que 0.

% Caso base: cuando K es 1, el primer elemento de la lista es el k-ésimo.
element_at(X, [X|_], 1).

% Caso recursivo: si K > 1, reduce K y busca en la cola de la lista.
element_at(X, [_|Tail], K) :- 
    K > 1,
    K1 is K - 1,           % Calcula el nuevo índice.
    element_at(X, Tail, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d], 3).
% X = c.
% ----------------------------------------------
