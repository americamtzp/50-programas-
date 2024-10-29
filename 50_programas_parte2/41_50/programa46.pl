% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que verifica si un
%              término representa un árbol multiway.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Program
% {
%     // Clase para representar un nodo de un árbol multiway.
%     class TreeNode
%     {
%         public int Value;
%         public List<TreeNode> Children;
% 
%         public TreeNode(int value)
%         {
%             Value = value;
%             Children = new List<TreeNode>();
%         }
%     }
% 
%     // Función para verificar si un nodo representa un árbol multiway.
%     static bool IsTree(TreeNode node)
%     {
%         // Un árbol multiway es un nodo con una lista de subárboles.
%         return node != null && (node.Children.Count == 0 || IsForest(node.Children));
%     }
% 
%     // Función para verificar si una lista de nodos representa un bosque de árboles multiway.
%     static bool IsForest(List<TreeNode> nodes)
%     {
%         if (nodes == null) return false; // Comprueba si la lista es nula.
%         foreach (var node in nodes)
%         {
%             if (!IsTree(node)) return false; // Verifica cada nodo.
%         }
%         return true; // Todos los nodos son árboles multiway.
%     }
% 
%     static void Main()
%     {
%         // Ejemplo de uso
%         TreeNode root = new TreeNode(1);
%         root.Children.Add(new TreeNode(2));
%         root.Children.Add(new TreeNode(3));
% 
%         Console.WriteLine("¿Es un árbol multiway? " + IsTree(root)); // Debe imprimir true
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado istree(T) que verifica si el término T
% representa un árbol multiway.

% Caso base: un árbol multiway es un nodo raíz con una lista vacía de subárboles.
istree(t(_, [])) :- !.

% Caso recursivo: un árbol multiway es un nodo raíz con un bosque de subárboles.
istree(t(_, Forest)) :- is_forest(Forest).

% Predicado is_forest(Forest) que verifica si una lista de términos
% representa un bosque de árboles multiway.

% Caso base: un bosque vacío es válido.
is_forest([]).

% Caso recursivo: verifica si cada árbol en la lista es un árbol multiway.
is_forest([T|Ts]) :- istree(T), is_forest(Ts).

% Ejemplo de uso:
% ?- istree(t(1, [t(2, []), t(3, [])])).
% true.
% ?- is_forest([t(1, [t(2, []), t(3, [])]), t(4, [])]).
% true.
% ----------------------------------------------
