% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que construye 
%              un árbol binario completo con N nodos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;

% class TreeNode
% {
%     public char Value;
%     public TreeNode Left;
%     public TreeNode Right;
% 
%     public TreeNode(char value)
%     {
%         Value = value;
%         Left = null;
%         Right = null;
%     }
% }
% 
% class Program
% {
%     static void Main()
%     {
%         int n = 7; // Número de nodos en el árbol
%         TreeNode root = CompleteBinaryTree(n);
%         Console.WriteLine("Árbol binario completo creado con " + n + " nodos.");
%     }
% 
%     // Función para construir un árbol binario completo
%     static TreeNode CompleteBinaryTree(int n)
%     {
%         if (n <= 0)
%             return null;
%         
%         return BuildTree(n);
%     }
% 
%     // Función auxiliar que construye el árbol recursivamente
%     static TreeNode BuildTree(int n)
%     {
%         TreeNode node = new TreeNode('x'); // Crear un nuevo nodo
%         int leftNodes = n / 2; // Calcular nodos del subárbol izquierdo
%         int rightNodes = n - leftNodes; // Calcular nodos del subárbol derecho
% 
%         node.Left = BuildTree(leftNodes); // Construir subárbol izquierdo
%         node.Right = BuildTree(rightNodes); // Construir subárbol derecho
% 
%         return node;
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado complete_binary_tree(N, Tree) que construye
% un árbol binario completo con N nodos.

% Caso base: un árbol con 0 nodos es nil.
complete_binary_tree(0, nil).

% Caso recursivo: construye un árbol binario completo.
complete_binary_tree(N, t('x', L, R)) :- 
    N > 0, 
    N1 is N - 1, 
    divide(N1, NL, NR), 
    complete_binary_tree(NL, L), 
    complete_binary_tree(NR, R).

% Divide el número de nodos para repartirlos entre los subárboles izquierdo y derecho.
divide(N, N1, N2) :- 
    N1 is N // 2, 
    N2 is N - N1.

% Ejemplo de uso:
% ?- complete_binary_tree(7, Tree).
% Tree = t('x', t('x', t('x', nil, nil), t('x', nil, nil)), 
%               t('x', t('x', nil, nil), t('x', nil, nil))).
% ----------------------------------------------
