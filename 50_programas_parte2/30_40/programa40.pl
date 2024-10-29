% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que construye 
%              un árbol binario equilibrado en altura
%              con un número dado de nodos. Se incluye
%              una versión comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% 
% // Definición de un nodo del árbol binario
% class TreeNode<T>
% {
%     public T Value;
%     public TreeNode<T> Left;
%     public TreeNode<T> Right;
%     
%     public TreeNode(T value)
%     {
%         Value = value;
%         Left = null;
%         Right = null;
%     }
% }
% 
% class BinaryTree
% {
%     // Método que construye un árbol equilibrado en altura con N nodos.
%     public static TreeNode<int> HbalTreeNodes(int n)
%     {
%         int height = (int)Math.Ceiling(Math.Log(n + 1) / Math.Log(2));
%         return BuildTree(height, ref n);
%     }
%     
%     // Método auxiliar para construir el árbol con una altura y número de nodos dados.
%     private static TreeNode<int> BuildTree(int height, ref int remainingNodes)
%     {
%         if (height == 0 || remainingNodes == 0)
%             return null;
%         
%         TreeNode<int> node = new TreeNode<int>(remainingNodes);
%         remainingNodes--;
%         
%         node.Left = BuildTree(height - 1, ref remainingNodes);
%         node.Right = BuildTree(height - 1, ref remainingNodes);
%         
%         return node;
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario equilibrado en altura con un número dado de nodos.
hbal_tree_nodes(N, T) :-
    hbal_height(N, H),          % Calcula la altura máxima para N nodos
    build_hbal_tree(H, N, T).    % Construye el árbol equilibrado

% Calcula la altura máxima de un árbol equilibrado en altura con N nodos.
hbal_height(N, H) :-
    H is ceiling(log(N + 1) / log(2)).

% Construye un árbol binario equilibrado con una altura específica y un número de nodos dado.
% Representa árboles como `nil` para hojas vacías o `tree(Node, Left, Right)` para nodos.
build_hbal_tree(0, 0, nil).  % Caso base: un árbol de altura 0 y 0 nodos es nil.
build_hbal_tree(H, N, tree(nil, L, R)) :- 
    H > 0,
    H1 is H - 1,
    % Distribuye nodos entre subárboles izquierdo y derecho
    LeftNodes is (N - 1) // 2,
    RightNodes is N - 1 - LeftNodes,
    build_hbal_tree(H1, LeftNodes, L),
    build_hbal_tree(H1, RightNodes, R).

% Ejemplo de uso:
% ?- hbal_tree_nodes(7, T).
% T = árbol equilibrado en altura con 7 nodos.
% ----------------------------------------------
