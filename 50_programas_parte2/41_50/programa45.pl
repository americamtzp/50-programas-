% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera 
%              la representación en cadena con puntos
%              de un árbol binario. Usa '.' para denotar
%              subárboles vacíos. Se incluye una versión
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% 
% class Program
% {
%     // Función para generar la representación en cadena de un árbol binario.
%     static string TreeDotString(Node node)
%     {
%         if (node == null)
%             return ".";
%         
%         // Generar la representación en cadena de los subárboles izquierdo y derecho.
%         return node.Value + TreeDotString(node.Left) + TreeDotString(node.Right);
%     }
% 
%     // Clase para representar un nodo de un árbol binario.
%     class Node
%     {
%         public char Value { get; }
%         public Node Left { get; }
%         public Node Right { get; }
% 
%         public Node(char value, Node left = null, Node right = null)
%         {
%             Value = value;
%             Left = left;
%             Right = right;
%         }
%     }
% 
%     static void Main()
%     {
%         // Crear un árbol binario para el ejemplo
%         Node root = new Node('a', new Node('b'), new Node('c'));
%         string result = TreeDotString(root);
% 
%         Console.WriteLine("Representación en cadena: " + result);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado tree_dotstring(S, Tree) que genera la
% representación en cadena con puntos de un árbol binario.

% Caso base: árbol vacío se representa con '.'.
tree_dotstring(nil, '.').

% Caso recursivo: se representa el nodo y se generan
% las representaciones de los subárboles izquierdo y derecho.
tree_dotstring(t(X, L, R), S) :- 
    tree_dotstring(L, SL), 
    tree_dotstring(R, SR), 
    format(atom(S), '~w~w~w', [X, SL, SR]).

% Ejemplo de uso:
% ?- tree_dotstring(t(a, t(b, nil, nil), t(c, nil, nil)), S).
% S = 'ab..c..'.
% ----------------------------------------------
