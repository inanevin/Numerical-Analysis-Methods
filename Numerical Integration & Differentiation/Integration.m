function [] = Integration()

% Author: Inan Evin
%
% This method calculates and plots analytical vs numerical integrations of
% the function sin(x).
% Variable 'index' represents the formula used for integration.
% Variables 'a' and 'b' are endpoints.
% Variable 'h' represents the interval for calculations.
% Import into matlab and hit run to see results.

% index = 0 - composite rectangle
% index = 1 - composite midpoint
% index = 2 - composite trapezoidal
index = 0;

% from 0 to 2pi
a = 0
b = 2 * pi;

% f is the function
f = @(x) sin(x)

% q is the integral function of f.
q = integral(f, a, b)

% h defines interval
h = 0.5

% x values from a to be with interval h
x = a:h:b;

% xMidpoint values, used for midpoint calculations
xMidpoint = (x(1:end-1) + x(2:end) ) / 2

% sin(x) values of the x range
y = f(x)

% sin(x) values corresponding to xMidpoint values. Used for midpoint calculations
yMidpoint = f(xMidpoint)

% open figure
figure();

% qEst is the interval estimate.
qEst = 0;

% composite rectangle
if index == 0
    % Define the length, and plot the function integral function. Area
    % under the curve defines the integral of sin(x) between a & b.
    n = length(x);
    ezplot(f, [a b]);
    hold on;
    % plot stairs.
    stairs(x,y,'r',  'MarkerFaceColor', 'c');
    stem(x,y,'r.');
    xlabel(h);
    hold off;
    
    % for each element of x values, add the corresponding y value from
    % sin(x) to the estimate.
    for k =1:n-1
        qEst = qEst + y(k);
    end
    
    % multiply with h to finalize the formula.
    qEst = qEst * h;

% composite midpoint
elseif index == 1
    % Define the length, and plot the function integral function. Area
    % under the curve defines the integral of sin(x) between a & b.
    n = length(xMidpoint);
    ezplot(f, [a b]);
    hold on;
    % plot the stairs using midpoints this time.
    stairs(x,y,'r');
    stem(x,y,'r.');
    stairs(xMidpoint,yMidpoint,'g*');
    stem(xMidpoint, yMidpoint,'g*');
    xlabel(h);
    hold off;
    % for each element of xMidpoint, add the corresponding y value, which
    % will be sin((xi+(xi+1)) / 2)
    for k=1:n
        qEst = qEst + yMidpoint(k);
    end
    % multiply with h to finalize the formula.
    qEst = qEst * h;
    
% composite trapezoidal
elseif index == 2
    % Define the length, and plot the function integral function. Area
    % under the curve defines the integral of sin(x) between a & b.
    n = length(y);
    ezplot(f, [a b]);
    hold on;
    stairs(x,y,'r');
    stem(x, y,'r*');
    xlabel(h);
    hold off;
    % apply the final trapezoidal formula, from 2 to n. (n-1 because our n
    % is actually the total length) Add each y value to estimate.
    for k=2:n-1
        qEst = qEst + y(k)
    end
    % multiply with the interval.
    qEst = qEst * h;
    % add the half of the first y and the final y.
    qEst = qEst + ( 0.5* (y(1) + y(n) ) );
end

% Display the results in command window.
display(double([q qEst]));

end

