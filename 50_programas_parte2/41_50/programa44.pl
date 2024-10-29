% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera la
%              secuencia de recorrido en preorden y
%              en orden de un árbol binario.
%              Se incluyen versiones comentadas
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Clase para representar un nodo de un árbol binario.
%     class TreeNode<T>
%     {
%         public T Value;
%         public TreeNode<T> Left;
%         public TreeNode<T> Right;
%         
%         public TreeNode(T value)
%         {
%             Value = value;
%             Left = null;
%             Right = null;
%         }
%     }
% 
%     // Función para generar la secuencia de recorrido en preorden.
%     static List<T> PreOrder<T>(TreeNode<T> node)
%     {
%         var result = new List<T>();
%         if (node != null)
%         {
%             result.Add(node.Value); // Visitar la raíz.
%             result.AddRange(PreOrder(node.Left)); // Recorrido en subárbol izquierdo.
%             result.AddRange(PreOrder(node.Right)); // Recorrido en subárbol derecho.
%         }
%         return result;
%     }
% 
%     // Función para generar la secuencia de recorrido en orden.
%     static List<T> InOrder<T>(TreeNode<T> node)
%     {
%         var result = new List<T>();
%         if (node != null)
%         {
%             result.AddRange(InOrder(node.Left)); // Recorrido en subárbol izquierdo.
%             result.Add(node.Value); // Visitar la raíz.
%             result.AddRange(InOrder(node.Right)); // Recorrido en subárbol derecho.
%         }
%         return result;
%     }
% 
%     static void Main()
%     {
%         // Ejemplo de uso con un árbol binario.
%         var root = new TreeNode<char>('a');
%         root.Left = new TreeNode<char>('b');
%         root.Right = new TreeNode<char>('c');
%         root.Left.Left = new TreeNode<char>('d');
%         root.Left.Right = new TreeNode<char>('e');
%         
%         var preOrderResult = PreOrder(root);
%         Console.WriteLine("Recorrido en preorden: " + string.Join(", ", preOrderResult));
% 
%         var inOrderResult = InOrder(root);
%         Console.WriteLine("Recorrido en orden: " + string.Join(", ", inOrderResult));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado preorder/2 que genera la secuencia de 
% recorrido en preorden de un árbol binario.

% Caso base: un árbol vacío produce una lista vacía.
preorder(nil, []).

% Caso recursivo: visitar la raíz y luego los subárboles.
preorder(t(X, L, R), [X|Seq]) :- 
    preorder(L, LL), 
    preorder(R, LR), 
    append(LL, LR, Seq).

% Predicado inorder/2 que genera la secuencia de 
% recorrido en orden de un árbol binario.

% Caso base: un árbol vacío produce una lista vacía.
inorder(nil, []).

% Caso recursivo: visitar el subárbol izquierdo, luego la raíz y el subárbol derecho.
inorder(t(X, L, R), Seq) :- 
    inorder(L, LL), 
    inorder(R, LR), 
    append(LL, [X|LR], Seq).

% Definición de un árbol binario para pruebas.
% Representa el árbol:
%     a
%    / \
%   b   c
%  / \
% d   e
arbol(t(a, t(b, t(d, nil, nil), t(e, nil, nil)), t(c, nil, nil))).

% Ejemplo de uso:
% Consulta para recorrido en preorden.
% ?- arbol(Arbol), preorder(Arbol, Secuencia).
% Esperado: Secuencia = [a, b, d, e, c].

% Consulta para recorrido en orden.
% ?- arbol(Arbol), inorder(Arbol, Secuencia).
% Esperado: Secuencia = [d, b, e, a, c].
% ----------------------------------------------
