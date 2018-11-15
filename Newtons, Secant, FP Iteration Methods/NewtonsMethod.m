%
% Netwon's method to find approximate solution for a given function.
%
% Author: Inan Evin
% Timestamp: 15.11.2018
%
% This time I plugged the function inside to avoid dealing with
% function handler passing as arguments because I wanted to use 
% diff method to automatically derivate the function inside here.
% However Matlab does not allow that on a function_handler.
% One option was to accept two arguments as f and dxf but then
% the derivation operations must have been done outside before calling
% this method, for the sake of simplicity for the assignment I didn't do
% it so you can test easily if you want to by just passing in tolerance
% and maxIterations.
% 
% Since the relatively significant topic here is the algorithm itself
% rather than the matlab syntax, I just left the function hard-coded
% inside.
% 
% Usage:
%
% >> myResult = NewtonsMethod(0.001, 100)
%
% where the first param is the tolerance and the 
% second one is the maximum number of iterations allowed.
% 

function [ result ] = NewtonsMethod( tolerance, maxIterations )

% Declare function F
syms f(x)
f(x) = 5 - 3.2 * (x-sin(x));

% Declare derivative of F.
dxf = diff(f);

% When we plot the function, we can see that it's between 2 and 3 so
% 3 is our first guest.
xCur = 3;

% Start the timer
tic;

for i = 1:maxIterations
% Calculate the next guess with newton's formula
xNext = xCur - ( double(f(xCur)) / double(dxf(xCur)) );

fprintf('x%d is %.5f -- x%d is %.5f\n', i,xCur, (i+1), xNext);

% fVal is the value of the function with our latest guess.
fVal = double(f(xNext));

fprintf('Function value with respect to x%d is: %.5f \n', (i+1), fVal);

    % If we got a result satisfying our tolerance break.
    if abs(fVal) < tolerance
        fprintf('Value is tolerable, breaking...\n');
        break;
    end

fprintf('Value is not tolerable, continuing iterations. Remaining iterations: %d \n\n', (maxIterations-i));
% Update current guess.
xCur = xNext;

end

%Stop the timer.
toc;

% Assign result
result = xNext;

end

