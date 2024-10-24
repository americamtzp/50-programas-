% ===============================================
% Autor: America Martinez Perez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el último elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# ------------
%	using System;
%	using System.Collections.Generic;
%
%	class Program
%	{
%	    static void Main(string[] args)
%	    {
%	        // Ejemplo de uso con una lista de enteros
%	        List<int> list = new List<int> { 1, 2, 3, 4 };
%	        int lastElement = MyLast(list);
%	        Console.WriteLine("El último elemento es: " + lastElement);
%	    }
%
%	    // Método que devuelve el último elemento de una lista genérica
%	    static T MyLast<T>(List<T> list)
%	    {
%	        if (list == null || list.Count == 0)
%	        {
%	            throw new ArgumentException("La lista debe contener al menos un elemento.");
%	        }
%
%	        return list[list.Count - 1]; // Devuelve el último elemento
%	    }
%	}
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Encuentra el último elemento de una lista.
% La lista debe tener al menos un elemento.
my_last(X, [X]).
my_last(X, [_|T]) :- my_last(X, T).
% ----------------------------------------------
