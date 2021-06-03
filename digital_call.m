% function V = digital_call(r,sigma,T,S,K,opt)
%
% Black-Scholes digital call option solution
%
% r - interest rate
% sigma - volatility
% T - time interval
% S - asset value
% K - strike price
% opt - ’value’, ’delta’, ’gamma’ or ’vega’
% V - option value
%
function V = digital_call(r,sigma,T,S,K,opt)
if nargin ~= 6
error('wrong number of arguments');
end
S = max(1e-100,S); % avoids problems with S=0
K = max(1e-100,K); % avoids problems with K=0
d2 = ( log(S) - log(K) + (r-0.5*sigma^2)*T ) / (sigma*sqrt(T));
switch opt
case 'value'
V = exp(-r*T).*N(d2);
case 'delta'
V = exp(-r*T)*(exp(-0.5*d2.^2)./sqrt(2*pi))./(sigma*sqrt(T)*S);
case 'gamma'
V = exp(-r*T)*(exp(-0.5*d2.^2)./sqrt(2*pi)) ...
.*(-d2./(sigma*sqrt(T)*S) - 1./S) ./(sigma*sqrt(T)*S);
case 'vega'
V = exp(-r*T)*(exp(-0.5*d2.^2)./sqrt(2*pi)).*(-d2/sigma-sqrt(T));
otherwise
error('invalid value for opt -- must be "value","delta", "gamma", "vega"')
end
%
% Normal cumulative distribution function
%
function ncf = N(x)
%ncf = 0.5*(1+erf(x/sqrt(2)));
xr = real(x);
xi = imag(x);
if abs(xi)>1e-10
error ’imag(x) too large in N(x)’
end
ncf = 0.5*(1+erf(xr/sqrt(2))) ...
+ i*xi.*exp(-0.5*xr.^2)/sqrt(2*pi);
