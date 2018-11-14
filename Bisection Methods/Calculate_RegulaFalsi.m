function [ result ] = Calculate_RegulaFalsi( f, a, b, tolerance, maxIterations )

% If the multiplication of the f(a) and f(b) is bigger than zero,
% then they have the same sign, meaning that no roots exist between a-b, so
% we return.
if f(a)*f(b) > 0
    fprintf('No root exists!\n');
    return
end

% Iterate for the desired times.
% Each iteration pick a new numerical solution between the previous
% intervals. Use the value where the line between f(a) and f(b) crosses the
% x axis. Use the formula given in the class to determine xNS. The rest is
% the same.
% check whether f(a).f(xNS) meets, if so, then move towards a.
% if not, then move towards b, set our lower limit as the NS.
% continue until the function value with the limit
% is close enough to zero as the tolerance.

for i = 1:maxIterations
    
    xNS = ( a * f(b) - b * f(a) ) / (f(b) - f(a) );
    
    if f(a) * f(xNS) < 0    % first half interval
        b = xNS;
    else                    % second half interval
        a = xNS;   
    end
    if abs(f(a)) < tolerance
        break;
    end
end

result = a;

end

