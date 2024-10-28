% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que verifica 
%              si una lista es un palíndromo.
%              
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función que verifica si una lista es un palíndromo en C#.
%     static bool IsPalindrome<T>(List<T> list)
%     {
%         if (list == null)
%             return false;
% 
%         List<T> reversedList = new List<T>(list);
%         reversedList.Reverse(); // Invierte la lista.
% 
%         // Compara la lista original con la lista invertida.
%         for (int i = 0; i < list.Count; i++)
%         {
%             if (!list[i].Equals(reversedList[i]))
%                 return false;
%         }
% 
%         return true; // Es un palíndromo.
%     }
% 
%     static void Main()
%     {
%         List<char> lista = new List<char> { 'a', 'b', 'c', 'b', 'a' };
%         bool esPalindromo = IsPalindrome(lista);
% 
%         Console.WriteLine("La lista es un palíndromo: " + esPalindromo);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado reverse_list(List, Reversed) que invierte la lista.
reverse_list([], []).  % Caso base: la lista vacía se invierte a sí misma.
reverse_list([H|T], Reversed) :-
    reverse_list(T, RevT),  % Invierte la cola de la lista.
    append(RevT, [H], Reversed).  % Agrega el cabeza al final.

% Predicado palindrome(List) que verifica si
% la lista List es un palíndromo.
palindrome(L) :- reverse_list(L, L).

% Ejemplo de uso:
% ?- palindrome([a, b, c, b, a]).
% true.
% ----------------------------------------------
