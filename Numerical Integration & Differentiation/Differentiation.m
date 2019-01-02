function [ ] = Differentiation( )

% Author: Inan Evin
%
% This method calculates and plots analytical vs numerical derivative of a
% the function sin(x). Changing index will result in changing the formula
% used for differentiation.
% Variable h represents the interval for calculations.
% Import into matlab and hit run to see results.

% index = 0 plots the analytic derivative only
% index = 1 plots the analytic & numerical der. using forward difference
% index = 2 plots the analytic & numerical der. using backward difference
% index = 3 plots the analytic & numerical der. using central difference
index = 1

% define interval
h = 0.5

% set x range
x = -pi:h:pi;

% y is a sin func. of x.
y = sin(x);

% yDeriv is cos func. of x.
yDeriv = cos(x);

% set a figure and plot the analytic derivative over x values.
fig = figure();
set(fig, 'color', 'white')
plot(x,yDeriv,'LineWidth',2)
xlabel('x')
ylabel('yDeriv')
grid on

% numerical forward diff.
if index == 1 
    % take a vector of y values starting from 2 to end, and y values
    % starting from 1 to end-1
    % this will be the addition of all points minus one preceeding point
    % e.g x=1 f(2) - f(1) , x=2 f(3) - f(2) , etc.
    % divide by h.
    yDerivEst = (y(2:end) - y(1:end-1))/h;
    hold on
    % plot until end-1 since we didnt calculate for the last x. 
    plot(x(1:end-1), yDerivEst, 'r-', 'LineWidth',2)
    legend('Analytical Derivative', 'Numerical Derivative')
    
% numerical backward diff.
elseif index == 2
    % same vector as above
    yDerivEst = (y(2:end) - y(1:end-1))/h;
    hold on
    % but this time plot is different since we start from the 2nd one and
    % go until the end.
    plot(x(2:end), yDerivEst, 'r-', 'LineWidth',2)
    legend('Analytical Derivative', 'Numerical Derivative')
    
% numerical central diff
elseif index == 3
    % we start from the second x, which will result in 3rd y - 1st y
    % so take from 3rd y to the end and substract first y to the end -2
    % divide by 2h
    yDerivEst = (y(3:end) - y(1:end-2))/ (h*2) ;
    hold on
    plot(x(2:end-1), yDerivEst, 'r-', 'LineWidth',2)
    legend('Analytical Derivative', 'Numerical Derivative')
end

end

