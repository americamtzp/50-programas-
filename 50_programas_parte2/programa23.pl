% =============================================== 
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que calcula el 
%              máximo común divisor (MCD) de dos 
%              números usando el algoritmo de Euclides.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% 
% class Program
% {
%     // Función para calcular el MCD usando el algoritmo de Euclides en C#.
%     static int Gcd(int x, int y)
%     {
%         // Si y es 0, el resultado es x.
%         if (y == 0)
%             return x;

%         // Recursión: calcula el MCD de y y el residuo de x % y.
%         return Gcd(y, x % y);
%     }
% 
%     static void Main()
%     {
%         int x = 56, y = 98;
%         int resultado = Gcd(x, y);
% 
%         Console.WriteLine("El MCD de {0} y {1} es: {2}", x, y, resultado);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado gcd(X, Y, G) que calcula el MCD de X y Y,
% y devuelve el resultado G.

% Caso base: cuando Y es 0, el MCD es X.
gcd(X, 0, X) :- X > 0.

% Caso recursivo: calcula el MCD de Y y el residuo de X % Y.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% Ejemplo de uso:
% ?- gcd(56, 98, G).
% G = 14.
% ----------------------------------------------
