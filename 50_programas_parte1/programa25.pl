% =============================================== 
% Autor: America Martinez Perez
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que calcula 
%              la función totiente de Euler, que cuenta
%              cuántos números menores que M son coprimos
%              con M. Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Función auxiliar para verificar si dos números son coprimos.
%     static bool Coprime(int a, int b)
%     {
%         return GCD(a, b) == 1; // Verifica si el máximo común divisor es 1.
%     }
%     
%     // Función que calcula el máximo común divisor (algoritmo de Euclides).
%     static int GCD(int a, int b)
%     {
%         while (b != 0)
%         {
%             int temp = b;
%             b = a % b;
%             a = temp;
%         }
%         return a;
%     }
%     
%     // Función que calcula la función totiente de Euler para un número M.
%     static int Totient(int M)
%     {
%         int count = 0;
%         for (int i = 1; i < M; i++)
%         {
%             if (Coprime(M, i))
%             {
%                 count++; // Cuenta cuántos números son coprimos con M.
%             }
%         }
%         return count;
%     }

%     static void Main()
%     {
%         int M = 10; // Ejemplo con M = 10
%         int phi = Totient(M);
%         Console.WriteLine("La función totiente de Euler para " + M + " es: " + phi);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado totient(M, Phi) que calcula la función
% totiente de Euler para un número M.

% Caso base: el totiente de 1 es 1.
totient(1, 1).

% Caso recursivo: se utiliza un acumulador para contar los coprimos.
totient(M, Phi) :- 
    M > 1, 
    totient_acc(M, M, 0, Phi).

% Caso base del acumulador: cuando K llega a 0, el acumulador tiene el resultado.
totient_acc(_, 0, Acc, Acc).

% Caso recursivo: si M y K son coprimos, aumenta el acumulador.
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    coprime(M, K), 
    Acc1 is Acc + 1, 
    K1 is K - 1, 
    totient_acc(M, K1, Acc1, Phi).

% Caso recursivo: si M y K no son coprimos, sigue sin aumentar el acumulador.
totient_acc(M, K, Acc, Phi) :- 
    K > 0, 
    \+ coprime(M, K), 
    K1 is K - 1, 
    totient_acc(M, K1, Acc, Phi).

% Definición del predicado coprime/2 usando el algoritmo de Euclides para el MCD.
coprime(A, B) :- 
    gcd(A, B, 1).

% Predicado que calcula el MCD de dos números usando el algoritmo de Euclides.
gcd(A, 0, A).
gcd(A, B, GCD) :- 
    B > 0, 
    R is A mod B, 
    gcd(B, R, GCD).

% Ejemplo de uso:
% ?- totient(10, Phi).
% Phi = 4.
% ----------------------------------------------
