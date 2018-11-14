%
% Netwon's method to find approximate solution for a given function.
%
% Author: Inan Evin
% Timestamp: 15.11.2018
%
% Fx & Gx are hard-coded because of explained reasons in NewtonMethod.m
% 
% Usage:
%
% >> myResult = FixedPointIteration(0.001, 100)
%
% where the first param is the tolerance and the 
% second one is the maximum number of iterations allowed.
% 

function [ result ] = FixedPointIteration( tolerance, maxIterations )

% Declare function F
syms f(x)
f(x) = 5 - 3.2 * (x-sin(x));

% Leave x out and declare gx.
syms g(x)
g(x) = (5 / 3.2) + sin(x); 

% Declare derivative of gx.
dxg = diff(g);

% When we plot the function, we can see that it's between 2 and 3 so
% we take 3 as our initial guess.
xCur = 3;

% Start the timer.
tic;

for i = 1:maxIterations

% Calculate next guess using FixedPointIteration Method
xNext = double(g(xCur));

% Check if the function converges.
    if abs(double(dxg(xCur))) >= 1
        fprintf('Function does not converge with this estimate root, aborting...\n')
        return;
    end
    
% fVal is the value of the function with our latest guest.
fVal = double(f(xNext));

fprintf('Function value with respect to x%d is: %.5f \n', (i+1), fVal);

    % If we got a result satisfying our tolerance break.
    if abs(fVal) < tolerance
        fprintf('Value is tolerable, breaking...\n');
        break;
    end

fprintf('Value is not tolerable, continuing iterations. Remaining iterations: %d \n\n', (maxIterations-i));

% Update the current x.
xCur = xNext;

end

%Stop the timer.
toc;

% Assign result
result = xNext;

end

