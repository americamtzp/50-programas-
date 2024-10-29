% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que genera un árbol 
%              de Huffman dado un conjunto de frecuencias.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
% 
% class Program
% {
%     // Clase para representar un nodo del árbol de Huffman.
%     class HuffmanNode
%     {
%         public char Symbol { get; set; }
%         public int Frequency { get; set; }
%         public HuffmanNode Left { get; set; }
%         public HuffmanNode Right { get; set; }
% 
%         public HuffmanNode(char symbol, int frequency)
%         {
%             Symbol = symbol;
%             Frequency = frequency;
%         }
%     }
% 
%     // Método para construir el árbol de Huffman.
%     static HuffmanNode BuildHuffmanTree(List<KeyValuePair<char, int>> frequencies)
%     {
%         // Caso base: si hay un solo símbolo, devuelve un nuevo nodo.
%         if (frequencies.Count == 1)
%         {
%             return new HuffmanNode(frequencies[0].Key, frequencies[0].Value);
%         }
% 
%         // Implementación del algoritmo de Huffman aquí...
%         // Esto es solo un lugar para la lógica completa.
% 
%         return null; // Retorno ficticio para completar el método.
%     }
% 
%     static void Main()
%     {
%         var frequencies = new List<KeyValuePair<char, int>>
%         {
%             new KeyValuePair<char, int>('a', 5),
%             new KeyValuePair<char, int>('b', 9),
%             new KeyValuePair<char, int>('c', 12),
%             new KeyValuePair<char, int>('d', 13),
%             new KeyValuePair<char, int>('e', 16),
%             new KeyValuePair<char, int>('f', 45)
%         };
%         
%         var huffmanTree = BuildHuffmanTree(frequencies);
% 
%         // Aquí se podría imprimir o utilizar el árbol generado.
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado huffman(Fs, H) que genera un árbol de Huffman 
% a partir de un conjunto de frecuencias Fs.

% Comprueba que la lista de frecuencias tenga más de un elemento
huffman(Fs, H) :- 
    length(Fs, Len), 
    Len > 1, 
    sort(2, @=<, Fs, Sorted), 
    huffman_tree(Sorted, H).

% Caso base: si hay un solo elemento, se crea el nodo
huffman_tree([fr(X, _)], hc(X, '0')). 

% Construcción del árbol de Huffman
huffman_tree([fr(X1, F1), fr(X2, F2) | T], Hs) :-
    F3 is F1 + F2,
    NewNode = fr(hc(X1, X2), F3),  % Crea un nuevo nodo combinando X1 y X2
    append(T, [NewNode], NewList),  % Agrega el nuevo nodo a la lista
    sort(2, @=<, NewList, SortedNext),  % Reordena la lista
    huffman_tree(SortedNext, Hs).  % Llama recursivamente y almacena en Hs

% Ejemplo de uso:
% ?- huffman([fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)], H).
% H = hc((hc(a, b), hc(c, d)), e). % Ejemplo de resultado
% ----------------------------------------------
