% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que selecciona 
%              un número dado de elementos aleatorios 
%              de una lista. Utiliza un generador de
%              números aleatorios y elimina los 
%              elementos seleccionados.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función para seleccionar N elementos aleatorios de una lista en C#.
%     static List<T> RndSelect<T>(List<T> list, int n)
%     {
%         Random rnd = new Random();
%         List<T> selected = new List<T>();

%         if (n > list.Count || n < 0)
%             throw new ArgumentException("N debe estar entre 0 y el tamaño de la lista.");

%         // Selección aleatoria de N elementos.
%         for (int i = 0; i < n; i++)
%         {
%             int index = rnd.Next(list.Count);
%             selected.Add(list[index]);     // Agrega el elemento aleatorio.
%             list.RemoveAt(index);          // Elimina el elemento seleccionado.
%         }

%         return selected;
%     }

%     static void Main()
%     {
%         List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
%         List<int> seleccionados = RndSelect(lista, 3);
%         
%         Console.WriteLine("Elementos seleccionados: " + string.Join(", ", seleccionados));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado rnd_select(Lista, N, Seleccion) que selecciona N
% elementos aleatorios de la lista original Lista, y los
% devuelve en la lista Seleccion.

% Predicado para obtener el elemento en la posición I.
% Caso base: el primer elemento es el que buscamos si el índice es 1.
element_at(X, [X|_], 1).

% Caso recursivo: sigue buscando en la cola de la lista.
element_at(X, [_|T], I) :-
    I > 1,                               % Asegura que el índice sea mayor que 1.
    I1 is I - 1,                         % Decrementa el índice.
    element_at(X, T, I1).                % Llama recursivamente.

% Caso base: Si N es 0, la lista de salida es vacía.
rnd_select(_, 0, []).

% Caso recursivo: selecciona un elemento aleatorio, lo elimina de la lista y repite.
rnd_select(L, N, [X|R]) :-
    length(L, Len),                       % Calcula la longitud de la lista.
    random(1, Len, I),                    % Genera un índice aleatorio entre 1 y Len.
    element_at(X, L, I),                  % Extrae el elemento en el índice I.
    delete(L, X, L1),                     % Elimina el elemento seleccionado de la lista original.
    N1 is N - 1,                          % Decrementa N.
    rnd_select(L1, N1, R).                % Llama recursivamente con la nueva lista y N1.

% Ejemplo de uso:
% ?- rnd_select([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3, R).
% R = [Elemento1, Elemento2, Elemento3].
% ----------------------------------------------
