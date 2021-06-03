function optval = PW_Vega_CallPut(S,Z,K,C,r,sigma,T)
% S = NSim x 1 matrix of simulated path
% K = Strike price
% C = 1 -> Call; C = 0 -> Put
Indicator = S(:,end);

if(C==1)
    Indicator(Indicator<=K) = 0;
    Indicator(Indicator>K) = 1;
    optval =exp(-r*T) * ...
        mean(S(:,end).*Indicator.*(-sigma*T+sqrt(T)*Z));
else
    Indicator(Indicator>=K) = 0;
    Indicator(Indicator<K) = 1;
    optval =exp(-r*T) * ...
        mean(S(:,end).*Indicator.*(-sigma*T+sqrt(T)*Z));
end
end