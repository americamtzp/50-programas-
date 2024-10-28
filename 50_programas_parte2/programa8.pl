% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que agrupa 
%              duplicados consecutivos de una lista 
%              en sublistas. Se incluye una versión 
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Método que agrupa duplicados consecutivos en sublistas.
%     static List<List<T>> Pack<T>(List<T> list)
%     {
%         if (list == null || list.Count == 0)
%             return new List<List<T>>(); // Retorna lista vacía si la entrada es nula o vacía.
%         
%         var result = new List<List<T>>();
%         var currentGroup = new List<T> { list[0] }; // Inicia el grupo con el primer elemento.
% 
%         for (int i = 1; i < list.Count; i++)
%         {
%             if (EqualityComparer<T>.Default.Equals(list[i], list[i - 1]))
%             {
%                 currentGroup.Add(list[i]); // Agrega el elemento si es igual al anterior.
%             }
%             else
%             {
%                 result.Add(currentGroup); // Agrega el grupo a la lista de resultados.
%                 currentGroup = new List<T> { list[i] }; // Inicia un nuevo grupo.
%             }
%         }
%         result.Add(currentGroup); // Agrega el último grupo.
%         return result;
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'a', 'b', 'b', 'c', 'a', 'a' };
%         var resultado = Pack(lista);
% 
%         foreach (var grupo in resultado)
%         {
%             Console.WriteLine("[" + string.Join(", ", grupo) + "]");
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado pack(List, Packed) que agrupa duplicados
% consecutivos de la lista List en sublistas dentro de Packed.

% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- 
    transfer(X, Xs, Ys, Rest), 
    pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(_, [], [], []). % Si la lista está vacía, no hay nada que transferir.

% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- 
    X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- 
    transfer(X, Xs, Ys, Rest).

% Ejemplo de uso:
% ?- pack([a, a, b, b, c, a, a], Result).
% Result = [[a, a], [b, b], [c], [a, a]].
% ----------------------------------------------
