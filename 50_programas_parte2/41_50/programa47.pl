% =============================================== 
% Autor: America Martinez Perez
% Fecha: 28 de octubre de 2024
% Descripción: Programa en Prolog que calcula 
%              la longitud del camino interno de un 
%              árbol multiway. Se incluye una versión 
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# ------------
% using System;
% using System.Collections.Generic;
% 
% class Node
% {
%     public List<Node> Children { get; set; }
%     
%     public Node()
%     {
%         Children = new List<Node>();
%     }
% }
% 
% class Program
% {
%     // Función que calcula la longitud del camino interno (IPL) de un árbol multiway.
%     static int CalculateIPL(Node root, int depth = 0)
%     {
%         if (root == null) return 0; // Caso base: si el nodo es nulo, la longitud es 0.
%         
%         int totalLength = depth; // Suma la profundidad actual al total.
% 
%         // Recorre los hijos y suma sus longitudes.
%         foreach (var child in root.Children)
%         {
%             totalLength += CalculateIPL(child, depth + 1);
%         }
% 
%         return totalLength; // Devuelve la longitud total.
%     }
% 
%     static void Main()
%     {
%         // Crear un árbol de ejemplo.
%         Node root = new Node();
%         Node child1 = new Node();
%         Node child2 = new Node();
%         root.Children.Add(child1);
%         root.Children.Add(child2);
%         child1.Children.Add(new Node()); // Agregar un hijo al primer nodo.
%         child2.Children.Add(new Node()); // Agregar un hijo al segundo nodo.
%         
%         int ipl = CalculateIPL(root); // Calcular la longitud del camino interno.
%         Console.WriteLine("La longitud del camino interno es: " + ipl);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado ipl(T, IPL) que calcula la longitud del
% camino interno IPL de un árbol multiway T.

% Se inicia el cálculo del IPL para un árbol dado.
ipl(t(_, Forest), IPL) :- 
    ipl_forest(Forest, 1, IPL).

% Calcula la longitud del camino interno para un bosque de árboles multiway.
ipl_forest([], _, 0). % Caso base: si el bosque está vacío, IPL es 0.
ipl_forest([T|Ts], Depth, IPL) :- 
    ipl(T, DIPL), % Calcula el IPL del árbol T.
    NextDepth is Depth + 1, % Incrementa la profundidad para los árboles restantes.
    ipl_forest(Ts, NextDepth, RestIPL), % Llama recursivamente para el resto del bosque.
    IPL is DIPL + RestIPL + Depth. % Suma el IPL actual con el resto y la profundidad actual.

% Calcula la longitud del camino interno de un árbol.
ipl(t(_, Forest), DIPL) :- 
    ipl_forest(Forest, 1, DIPL).

% Ejemplo de uso:
% ?- ipl(t(a, [t(b, []), t(c, [t(d, []), t(e, [])])]), IPL).
% IPL = 6.
% ----------------------------------------------
