% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que agrupa los
%              elementos de un conjunto en
%              subconjuntos disjuntos dados los 
%              tamaños de los subgrupos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función que encuentra una combinación de tamaño n en un conjunto
%     static List<T> Combination<T>(int n, List<T> elements)
%     {
%         return elements.Take(n).ToList(); // Retorna los primeros n elementos como ejemplo.
%     }
% 
%     // Función para agrupar los elementos de un conjunto en subgrupos dados los tamaños
%     static List<List<T>> Group<T>(List<int> sizes, List<T> elements)
%     {
%         var result = new List<List<T>>();
%         var remainingElements = new List<T>(elements);
% 
%         foreach (int size in sizes)
%         {
%             var group = Combination(size, remainingElements);
%             result.Add(group);
%             remainingElements = remainingElements.Skip(size).ToList(); // Resta elementos
%         }
% 
%         return result; // Devuelve los grupos formados
%     }
% 
%     static void Main()
%     {
%         List<int> sizes = new List<int> { 2, 2 };
%         List<char> elements = new List<char> { 'a', 'b', 'c', 'd' };
%         var groups = Group(sizes, elements);
% 
%         Console.WriteLine("Grupos formados:");
%         foreach (var group in groups)
%         {
%             Console.WriteLine(string.Join(", ", group));
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado group/3 que agrupa los elementos Es en
% subconjuntos disjuntos Gs, dados los tamaños Ns.

% Caso base: cuando todos los grupos están formados.
group([], [], []).

% Caso recursivo: crea un grupo de tamaño N, resta los elementos usados, 
% y continúa agrupando el resto de los elementos.
group([N|Ns], Es, [G|Gs]) :-
    combination(N, Es, G),          % Encuentra una combinación de N elementos en Es
    subtract(Es, G, Rest),          % Resta los elementos G del conjunto Es
    group(Ns, Rest, Gs).            % Forma el resto de los grupos

% Predicado que encuentra una combinación de N elementos de una lista.
combination(0, _, []).
combination(N, [X|Xs], [X|Ys]) :-
    N > 0,
    N2 is N - 1,
    combination(N2, Xs, Ys).
combination(N, [_|Xs], Ys) :-
    N > 0,
    combination(N, Xs, Ys).

% subtract/3 está disponible en la biblioteca estándar de Prolog para restar elementos.

% Ejemplo de uso:
% ?- group([2, 2], [a, b, c, d], Gs).
% Gs = [[a, b], [c, d]].
% ----------------------------------------------
