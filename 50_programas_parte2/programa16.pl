% =============================================== 
% Autor: Juan Pérez
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que extrae N 
%              números aleatorios de un rango dado.
% ===============================================

% Predicado range(Low, High, List) que genera una lista de números de Low a High.
range(Low, High, []) :- 
    Low > High, !.        % Caso base: si Low es mayor que High, la lista está vacía.
range(Low, High, [Low|Rest]) :-  
    Next is Low + 1,      % Caso recursivo: incrementa Low.
    range(Next, High, Rest).

% Predicado rnd_select(List, N, Result) que selecciona N elementos aleatorios de una lista.
rnd_select(_, 0, []) :- !.   % Caso base: si N es 0, la lista resultante está vacía.
rnd_select(List, N, [Elem|Rest]) :-
    length(List, Len),                      % Calcula la longitud de la lista.
    random_between(1, Len, Index),          % Elige un índice aleatorio.
    nth1(Index, List, Elem),                % Encuentra el elemento en la posición Index.
    delete(List, Elem, NewList),            % Elimina el elemento seleccionado de la lista.
    N1 is N - 1,                            % Decrementa N.
    rnd_select(NewList, N1, Rest).          % Llamada recursiva para seleccionar más elementos.

% Predicado lotto(N, M, L) que genera una lista L de N números aleatorios entre 1 y M.
lotto(N, M, L) :-
    range(1, M, R),       % Genera la lista de números del 1 al M.
    rnd_select(R, N, L).  % Selecciona N elementos aleatorios de la lista generada.

% Ejemplo de uso:
% ?- lotto(6, 49, L).
% L = [23, 1, 34, 12, 6, 45].
