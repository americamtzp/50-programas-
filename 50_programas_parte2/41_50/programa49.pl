% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que genera 
%              el diseño de un árbol binario, 
%              posicionando cada nodo en una cuadrícula.
%              Se incluye una versión comentada
%              en C# para referencia.
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
%     static void Main(string[] args)
%     {
%         // Creando un árbol binario de ejemplo
%         Nodo raiz = new Nodo(1);
%         raiz.Izquierda = new Nodo(2);
%         raiz.Derecha = new Nodo(3);
%         raiz.Izquierda.Izquierda = new Nodo(4);
%         raiz.Izquierda.Derecha = new Nodo(5);
% 
%         // Generando el diseño del árbol
%         Layout(raiz, 0, 0);
%     }
% 
%     static void Layout(Nodo nodo, int x, int y)
%     {
%         if (nodo == null)
%             return;
%         
%         // Imprimir la posición del nodo
%         Console.WriteLine($"Nodo: {nodo.Valor} en posición ({x}, {y})");
%         
%         // Llamadas recursivas para hijos izquierdo y derecho
%         Layout(nodo.Izquierda, x - 1, y + 1);  // Mover a la izquierda
%         Layout(nodo.Derecha, x + 1, y + 1);     // Mover a la derecha
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado layout_binary_tree(T, PT) que genera el
% diseño de un árbol binario T, con posiciones en PT.

% Llama a layout con coordenadas iniciales (1, 1).
layout_binary_tree(T, PT) :- layout(T, 1, 1, PT, _).

% Layout con coordenadas iniciales (X, Y).
layout(nil, _, _, nil, 0). % Caso base: árbol vacío.
layout(t(W, L, R), X, Y, t(W, X, Y, PL, PR), X2) :-
    X1 is X + 1,              % Incrementa X para el hijo izquierdo.
    layout(L, X, Y + 1, PL, XL),  % Layout del hijo izquierdo.
    layout(R, X1, Y + 1, PR, X2). % Layout del hijo derecho.

% Ejemplo de uso:
% ?- layout_binary_tree(t(1, t(2, t(4, nil, nil), t(5, nil, nil)), t(3, nil, nil)), PT).
% PT = t(1, 1, 1, t(2, 1, 2, t(4, 1, 3, nil, nil), t(
