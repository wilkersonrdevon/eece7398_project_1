% Computes the partial derivative of Bezier polynomial with respect to s
%
% Inputs:
%       s: gait timing variable
%       M: order of polynomial
%       a: coefficients for polynomial (must be M+1)
%
% Output:  
%       b: Bezier polynomial
% 
% Written by Pravin Dangol, 02-20-2019, Boston, MA
%
% Notes:
%   for a normalized general coordinate s = (theta(q) - min(theta))/(max(theta) - min(theta))
%   the function ouputs a 1 dimensional partial derivative of Bezier polynomial of order M
%   the coefficient alpha of size 1 by M+1 must be provided

function db_ds = d_ds_bezier(s,M,a)

[i,j] = size(a);
if i > 1
    error('alpha vector must be 1D in length')
elseif j > M+1
    error('alpha vector must be size 1 by M+1')
end

db_ds = 0;
for k = 0:M-1
    db_ds = db_ds + (a(1,k+2)-a(1,k+1))*(factorial(M)/(factorial(k)*factorial(M-k-1)))*s^k*(1-s)^(M-k-1);
end

end