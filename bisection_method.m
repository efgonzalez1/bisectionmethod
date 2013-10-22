% ============================================================================
% The Bisection Method
% --------------------
%
% PURPOSE:  Use the Bisection Method to approximate roots of functions
%
% INPUT VARIABLES:
%                  f : inline function,
%                  a : lower bound,
%                  b : upper bound,
%                  n_max : max # of iterations,
%                  tolerance : (optional) default is eps
%
% SAMPLE INPUT:
%                   f = inline('2*sin(x) - x');
%                   a = 1; b = 2*pi;
%                   n_max = 100; tolerance = 1e-5;
%
% OUTPUT:  Approximation of root  (OR)  Error message.
%
% AUTHOR:  Fernando Gonzalez (Esteban)
%
% LAST UPDATE: 10/02/2013
%
% ============================================================================


% Use eps if tolerance is not defined
if ~exist('tolerance')
    tolerance = eps;
end

% Exit if a > b
if a > b
    disp(sprintf('>> Please make sure a < b.\n'))
    break
end

% Bisect bounds and approximate root
n = 1;
while n <= n_max
    p = (a + b) / 2;

    if (f(p) == 0) || (((b - a)/2) < tolerance)
        solution = sprintf('>> Root = %f\n', p);
        disp(solution);
        break
    end

    n = n + 1;

    % Check if bounds are opposite sign
    if (f(a) * f(p)) > 0
        a = p;
    else
        b = p;
    end
end

% If root approximation not found, display error
if n > n_max
    err = sprintf('>> Bisection Method Failed After  %d  iterations.\n', n_max);
    disp(err);
end
