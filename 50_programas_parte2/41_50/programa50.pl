% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que representa 
%              un árbol binario como una cadena y 
%              viceversa. Se incluye una versión 
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Text;

% class Node
% {
%     public int Value;
%     public Node Left;
%     public Node Right;

%     public Node(int value)
%     {
%         Value = value;
%         Left = null;
%         Right = null;
%     }
% }

% class Program
% {
%     // Método para convertir un árbol binario a una cadena
%     static string TreeToString(Node node)
%     {
%         if (node == null)
%             return ""; // Retorna una cadena vacía para un nodo nulo
%         
%         string leftString = TreeToString(node.Left);
%         string rightString = TreeToString(node.Right);
%         return $"{node.Value}({leftString},{rightString})"; // Formato de la cadena
%     }

%     static void Main()
%     {
%         // Creando un árbol binario
%         Node root = new Node(1);
%         root.Left = new Node(2);
%         root.Right = new Node(3);
%         root.Left.Left = new Node(4);
%         root.Left.Right = new Node(5);
% 
%         string treeString = TreeToString(root);
%         Console.WriteLine("Representación del árbol: " + treeString);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado tree_string(Tree, String) que convierte
% un árbol binario en una cadena y viceversa.

% Caso base: un árbol vacío se representa como una cadena vacía.
tree_string(nil, '').

% Caso recursivo: convierte un nodo en una cadena.
tree_string(t(X, L, R), S) :- 
    tree_string(L, SL), 
    tree_string(R, SR), 
    format(atom(S), '~w(~w,~w)', [X, SL, SR]). 

% Ejemplo de uso:
% ?- tree_string(t(1, t(2, t(4, nil, nil), t(5, nil, nil)), t(3, nil, nil)), S).
% S = '1(2(4, ,5),3)'.
% ----------------------------------------------
