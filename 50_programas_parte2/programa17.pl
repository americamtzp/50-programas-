% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que genera una
%              permutación aleatoria de los elementos
%              de una lista. Se incluye una versión
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que genera una permutación aleatoria de una lista en C#.
%     static List<T> RandomPermutation<T>(List<T> list)
%     {
%         Random rnd = new Random();
%         List<T> result = new List<T>(list);
%         
%         // Algoritmo de Fisher-Yates para barajar la lista.
%         for (int i = result.Count - 1; i > 0; i--)
%         {
%             int j = rnd.Next(0, i + 1);
%             T temp = result[i];
%             result[i] = result[j];
%             result[j] = temp;
%         }
%         
%         return result; // Devuelve la lista permutada.
%     }
% 
%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%         List<int> permutacion = RandomPermutation(lista);
%         
%         Console.WriteLine("Permutación aleatoria: " + string.Join(", ", permutacion));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_permu(List, Perm) que genera una
% permutación aleatoria Perm de la lista List.

rnd_permu(L, P) :- 
    length(L, Len),        % Calcula la longitud de la lista L.
    rnd_select(L, Len, P). % Llama a rnd_select para seleccionar elementos aleatoriamente.

% Predicado que selecciona N elementos aleatorios de la lista L.
rnd_select(_, 0, []) :- !.  % Caso base: si N es 0, la permutación es vacía.
rnd_select(L, N, [X|T]) :- 
    N > 0, 
    length(L, Len),                % Calcula la longitud de la lista.
    random_between(1, Len, I),     % Genera un índice aleatorio I.
    nth1(I, L, X),                 % Selecciona el elemento en la posición I.
    delete(L, X, Rest),            % Elimina ese elemento de la lista.
    N1 is N - 1,                   % Decrementa el contador N.
    rnd_select(Rest, N1, T).       % Llama recursivamente para los N1 elementos restantes.

% Ejemplo de uso:
% ?- rnd_permu([1, 2, 3, 4, 5], P).
% P = [2, 5, 1, 4, 3].
% ----------------------------------------------
