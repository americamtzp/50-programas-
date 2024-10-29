% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que genera 
%              el código Gray de N bits.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Función para generar el código Gray de N bits.
%     static List<string> Gray(int n)
%     {
%         if (n == 1)
%             return new List<string> { "0", "1" };
% 
%         // Genera el código Gray para N-1 bits.
%         var previousGray = Gray(n - 1);
%         var result = new List<string>();
% 
%         // Añade '0' al principio de cada elemento de la lista anterior.
%         result.AddRange(previousGray.Select(code => "0" + code));
% 
%         // Añade '1' al principio de los elementos en orden inverso.
%         for (int i = previousGray.Count - 1; i >= 0; i--)
%         {
%             result.Add("1" + previousGray[i]);
%         }
% 
%         return result;
%     }
% 
%     static void Main()
%     {
%         int n = 3; // Ejemplo con 3 bits
%         var grayCodes = Gray(n);
% 
%         Console.WriteLine("Código Gray de " + n + " bits:");
%         foreach (var code in grayCodes)
%         {
%             Console.WriteLine(code);
%         }
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado gray(N, C) que genera el código Gray de N bits.

% Caso base: el código Gray de 1 bit.
gray(1, ['0', '1']).

% Caso recursivo: genera el código Gray para N-1 bits.
gray(N, C) :- 
    N > 1, 
    N1 is N - 1, 
    gray(N1, C1), 
    maplist(atom_concat('0'), C1, C0), 
    reverse(C1, C1R), 
    maplist(atom_concat('1'), C1R, C1G), 
    append(C0, C1G, C).

% Ejemplo de uso:
% ?- gray(3, Codes).
% Codes = ['000', '001', '011', '010', '110', '111', '101', '100'].
% ----------------------------------------------
