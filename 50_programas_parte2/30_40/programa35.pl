% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que construye un
%              árbol binario completamente equilibrado
%              con N nodos. Un árbol completamente equilibrado 
%              tiene subárboles cuya diferencia de tamaño es como máximo 1.
%              Se incluye una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Node
% {
%     public char Value;
%     public Node Left, Right;
%     
%     public Node(char value, Node left = null, Node right = null)
%     {
%         Value = value;
%         Left = left;
%         Right = right;
%     }
% }
% 
% class Program
% {
%     // Método para construir un árbol binario completamente equilibrado con N nodos
%     static Node CbalTree(int n)
%     {
%         if (n == 0) return null;
%         int n1, n2;
%         Divide(n - 1, out n1, out n2); // Divide el número de nodos
%         
%         Node left = CbalTree(n1);
%         Node right = CbalTree(n2);
%         return new Node('x', left, right); // Nodo raíz con subárboles izquierdo y derecho
%     }
%     
%     // Método para dividir el número de nodos entre dos subárboles
%     static void Divide(int n, out int n1, out int n2)
%     {
%         n1 = n / 2;
%         n2 = n - n1;
%     }
% 
%     static void Main()
%     {
%         int n = 4;
%         Node root = CbalTree(n);
%         Console.WriteLine("Árbol binario equilibrado con " + n + " nodos construido.");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado cbal_tree(N, Tree) que construye un
% árbol binario completamente equilibrado con N nodos.
% La raíz es un nodo 'x', y los subárboles izquierdo y derecho
% están equilibrados.

% Caso base: un árbol con 0 nodos es nil.
cbal_tree(0, nil).

% Caso recursivo: construye el nodo raíz 'x' con subárboles izquierdo y derecho.
cbal_tree(N, t('x', L, R)) :-
    N > 0,
    N1 is N - 1,
    divide(N1, N2, N3),
    cbal_tree(N2, L),
    cbal_tree(N3, R).

% Predicado divide(N, N1, N2) que divide el número de nodos entre dos subárboles.
divide(N, N1, N2) :-
    N1 is N // 2,
    N2 is N - N1.

% Ejemplo de uso:
% ?- cbal_tree(4, Tree).
% Tree = t('x', t('x', nil, nil), t('x', nil, t('x', nil, nil))).
% ----------------------------------------------
