% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera la
%              representación en cadena de un árbol binario.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% 
% class Program
% {
%     // Clase para representar un nodo de un árbol binario.
%     class TreeNode
%     {
%         public char Value;
%         public TreeNode Left;
%         public TreeNode Right;
% 
%         public TreeNode(char value, TreeNode left = null, TreeNode right = null)
%         {
%             Value = value;
%             Left = left;
%             Right = right;
%         }
%     }
% 
%     // Método que genera la representación en cadena de un árbol binario.
%     static string TreeString(TreeNode node)
%     {
%         if (node == null)
%             return "nil";
% 
%         return $"t({node.Value}, {TreeString(node.Left)}, {TreeString(node.Right)})"; // Devuelve la representación en cadena.
%     }
% 
%     static void Main()
%     {
%         // Creación de un árbol binario para ejemplo.
%         TreeNode root = new TreeNode('a',
%             new TreeNode('b'),
%             new TreeNode('c'));
% 
%         string result = TreeString(root);
%         Console.WriteLine(result); // Imprime la representación en cadena del árbol.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado tree_string(Tree, String) que genera la
% representación en cadena de un árbol binario.

% Caso base: un árbol vacío se representa como 'nil'.
tree_string(nil, 'nil').

% Caso recursivo: genera la representación de un árbol con raíz, subárbol izquierdo y subárbol derecho.
tree_string(t(X, L, R), S) :- 
    tree_string(L, SL), 
    tree_string(R, SR), 
    format(atom(S), 't(~w, ~w, ~w)', [X, SL, SR]).

% Ejemplo de uso:
% ?- tree_string(t(a, t(b, nil, nil), t(c, nil, nil)), S).
% S = 't(a, t(b, nil, nil), t(c, nil, nil))'.
% ----------------------------------------------
