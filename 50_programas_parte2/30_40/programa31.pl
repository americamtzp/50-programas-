% =============================================== 
% Autor: America Martinez Perez
% Fecha: 23 de octubre de 2024
% Descripción: Programa en Prolog que genera una 
%              tabla de verdad para una expresión lógica
%              en dos variables. Se incluye una versión 
%              comentada en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% 
% class Program
% {
%     // Función que evalúa una expresión lógica y genera la tabla de verdad.
%     static void Table(Func<bool, bool, bool> expr)
%     {
%         bool[] values = { true, false };
%         
%         // Genera todas las combinaciones de A y B.
%         foreach (bool A in values)
%         {
%             foreach (bool B in values)
%             {
%                 // Imprime A, B y el resultado de la expresión lógica.
%                 Console.WriteLine($"{A} {B} {expr(A, B)}");
%             }
%         }
%     }
% 
%     static void Main()
%     {
%         // Ejemplo: expresión lógica A && B (AND lógico).
%         Table((A, B) => A && B);
%     }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado table/1 que genera una tabla de verdad para
% una expresión lógica en dos variables A y B.

% Genera la tabla de verdad evaluando todas las combinaciones de A y B.
table(Expr) :-
    write('A B Resultado'), nl,
    (   A = true, B = true, eval_expr(A, B, Expr);
        A = true, B = false, eval_expr(A, B, Expr);
        A = false, B = true, eval_expr(A, B, Expr);
        A = false, B = false, eval_expr(A, B, Expr)
    ).

% Predicado auxiliar para evaluar y escribir el resultado de la expresión.
eval_expr(A, B, Expr) :-
    (   Expr =.. [Op, A, B], call(Op, A, B) -> Result = true ; Result = false ),
    write(A), write(' '), write(B), write(' '), write(Result), nl.

% Ejemplo de uso:
% ?- table((A, B)).
% A B Resultado
% true true true
% true false false
% false true false
% false false false
% ----------------------------------------------
