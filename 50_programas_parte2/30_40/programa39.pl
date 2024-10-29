% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que construye un 
%              árbol binario equilibrado en altura 
%              con una altura dada.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% 
% // Clase que representa un nodo de árbol binario.
% class TreeNode
% {
%     public char Value;
%     public TreeNode Left, Right;
%     
%     public TreeNode(char value)
%     {
%         Value = value;
%         Left = Right = null;
%     }
% }
% 
% class Program
% {
%     // Función que construye un árbol binario equilibrado en altura.
%     static TreeNode BuildHbalTree(int height)
%     {
%         if (height <= 0)
%             return null; // Un árbol de altura 0 es nulo.
%         
%         var node = new TreeNode('x'); // Nodo raíz con valor 'x'.
%         node.Left = BuildHbalTree(height - 1);
%         node.Right = BuildHbalTree(height - 2);
%         
%         return node;
%     }
%     
%     static void Main()
%     {
%         int altura = 3;
%         TreeNode arbol = BuildHbalTree(altura);
%         
%         Console.WriteLine("Árbol binario equilibrado de altura " + altura + " construido.");
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado hbal_tree(H, Tree) que construye un
% árbol binario equilibrado en altura H.

% Caso base: un árbol de altura 0 es un árbol vacío (nil).
hbal_tree(0, nil).

% Caso base para altura 1: un árbol con un solo nodo raíz y sin subárboles.
hbal_tree(1, t('x', nil, nil)).

% Caso recursivo: construye un árbol binario equilibrado en altura con subárboles 
% cuya diferencia de altura es como máximo 1.
hbal_tree(H, t('x', L, R)) :-
    H > 1,
    H1 is H - 1,
    H2 is H - 2,
    (hbal_tree(H1, L), hbal_tree(H1, R); % Ambos subárboles de altura H1
     hbal_tree(H1, L), hbal_tree(H2, R); % Subárbol izquierdo de H1, derecho de H2
     hbal_tree(H2, L), hbal_tree(H1, R)). % Subárbol izquierdo de H2, derecho de H1

% Ejemplo de uso:
% ?- hbal_tree(3, Tree).
% Tree = t('x', t('x', t('x', nil, nil), t('x', nil, nil)), t('x', t('x', nil, nil), nil)).
% ----------------------------------------------
