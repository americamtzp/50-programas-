% =============================================== 
% Autor: America Martinez Perez
% Fecha: 29 de octubre de 2024
% Descripción: Programa en Prolog que cuenta el 
%              número de hojas en un árbol binario.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
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
%     // Función que cuenta el número de hojas en un árbol binario en C#.
%     static int CountLeaves(Nodo nodo)
%     {
%         if (nodo == null)
%             return 0; // Si el nodo es nulo, no hay hojas.
%         
%         if (nodo.Izquierda == null && nodo.Derecha == null)
%             return 1; // Si el nodo es una hoja, cuenta como 1.
%         
%         // Suma las hojas de los subárboles izquierdo y derecho.
%         return CountLeaves(nodo.Izquierda) + CountLeaves(nodo.Derecha);
%     }
% 
%     static void Main()
%     {
%         // Creación de un árbol binario de ejemplo.
%         Nodo raiz = new Nodo(1);
%         raiz.Izquierda = new Nodo(2);
%         raiz.Derecha = new Nodo(3);
%         raiz.Izquierda.Izquierda = new Nodo(4);
%         raiz.Izquierda.Derecha = new Nodo(5);
% 
%         int hojas = CountLeaves(raiz);
%         Console.WriteLine("Número de hojas en el árbol: " + hojas);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado count_leaves(Tree, N) que cuenta el
% número de hojas en un árbol binario.

% Caso base: si el árbol es nil, hay 0 hojas.
count_leaves(nil, 0).

% Caso base: si el nodo es una hoja, cuenta como 1.
count_leaves(t(_, nil, nil), 1).

% Caso recursivo: suma las hojas de los subárboles izquierdo y derecho.
count_leaves(t(_, L, R), N) :- 
    count_leaves(L, NL), 
    count_leaves(R, NR), 
    N is NL + NR.

% Ejemplo de uso:
% ?- count_leaves(t(1, t(2, t(4, nil, nil), t(5, nil, nil)), t(3, nil, nil)), N).
% N = 3.
% ----------------------------------------------
