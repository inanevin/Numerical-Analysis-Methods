%
% Netwon's method to find approximate solution for a given function.
%
% Author: Inan Evin
% Timestamp: 15.11.2018
%
% This time no need to take derivative so I could have actually taken
% the function as an argument, but because of the reasons I had explained
% in the NewtonsMethod I thought I would have consistency between my
% methods so I hard-coded the function in here as well.
% 
% Usage:
%
% >> myResult = SecantMethod(0.001, 100)
%
% where the first param is the tolerance and the 
% second one is the maximum number of iterations allowed.
% 

function [ result ] = SecantMethod( tolerance, maxIterations )

% Declare function F
syms f(x)
f(x) = 5 - 3.2 * (x-sin(x));

% When we plot the function, we can see that it's between 2 and 3 so
% The function has a negative value around 3 and positive value around 2.
% So we will select 3 as current and 2 as previous.
xCur = -100;
xPrev = 100;

for i = 1:maxIterations
% Calculate the next guess with newton's formula
xNext = xCur - (double(f(xCur)) * (xCur-xPrev)) / (double(f(xCur)) - double(f(xPrev)));

fprintf('x%d is %.5f -- x%d is %.5f\n', i,xCur, (i+1), xNext);

% fVal is the value of the function with our latest guest.
fVal = double(f(xNext));

fprintf('Function value with respect to x%d is: %.5f \n', (i+1), fVal);

    % If we got a result satisfying our tolerance break.
    if abs(fVal) < tolerance
        fprintf('Value is tolerable, breaking...\n');
        break;
    end

fprintf('Value is not tolerable, continuing iterations. Remaining iterations: %d \n\n', (maxIterations-i));
% Update previous and current guess.
xPrev = xCur;
xCur = xNext;

end

result = xNext;

end

