% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que colecta 
%              todas las hojas de un árbol binario 
%              en una lista. Se incluye una versión
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Nodo
% {
%     public int Valor;
%     public Nodo Izquierda;
%     public Nodo Derecha;
%     
%     public Nodo(int valor)
%     {
%         Valor = valor;
%         Izquierda = null;
%         Derecha = null;
%     }
% }
% 
% class Program
% {
%     // Función para colectar las hojas de un árbol binario en una lista.
%     static List<int> Leaves(Nodo root)
%     {
%         List<int> leaves = new List<int>();
%         CollectLeaves(root, leaves);
%         return leaves;
%     }
% 
%     static void CollectLeaves(Nodo node, List<int> leaves)
%     {
%         if (node == null)
%             return;
%         
%         if (node.Izquierda == null && node.Derecha == null)
%         {
%             leaves.Add(node.Valor); // Agrega el valor de la hoja a la lista.
%         }
%         else
%         {
%             CollectLeaves(node.Izquierda, leaves);
%             CollectLeaves(node.Derecha, leaves);
%         }
%     }
% 
%     static void Main()
%     {
%         // Crear un árbol binario de ejemplo
%         Nodo root = new Nodo(1);
%         root.Izquierda = new Nodo(2);
%         root.Derecha = new Nodo(3);
%         root.Izquierda.Izquierda = new Nodo(4);
%         root.Izquierda.Derecha = new Nodo(5);
% 
%         List<int> hojas = Leaves(root);
% 
%         Console.WriteLine("Las hojas del árbol son: " + string.Join(", ", hojas));
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado leaves/2 que colecta todas las hojas
% de un árbol binario en una lista.

% Caso base: si el árbol está vacío, la lista de hojas es vacía.
leaves(nil, []).

% Caso base: si el nodo es una hoja, agrega su valor a la lista.
leaves(t(X, nil, nil), [X]).

% Caso recursivo: colecta hojas del subárbol izquierdo y derecho.
leaves(t(_, L, R), Leaves) :-
    leaves(L, LL), 
    leaves(R, LR), 
    append(LL, LR, Leaves).

% Ejemplo de uso:
% ?- leaves(t(1, t(2, t(4, nil, nil), t(5, nil, nil)), t(3, nil, nil)), Hojas).
% Hojas = [4, 5, 3].
% ----------------------------------------------
