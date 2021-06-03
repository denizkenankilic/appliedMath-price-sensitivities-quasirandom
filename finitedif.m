S = 80; % Spot
K = 100; % Strike
T = 1; % Maturity
N = 100; % Number of sample paths
sigma = .3; %Volatility
r = .1; % Interest rate

z = randn(N,1); % For each sample path, draw a random number to simulate terminal price of underlying
d_S = 1/365.25; % Size of increment/decrement to calculate delta and gamma

payoff = max(S*exp((r-sigma^2/2)*T+sigma*sqrt(T)*z)-K,0); % Option payoff with spot = S
payoff_Sp = max((S+d_S)*exp((r-sigma^2/2)*T+sigma*sqrt(T)*z)-K,0); % Option payoff with spot = S + d_S
payoff_Sm = max((S-d_S)*exp((r-sigma^2/2)*T+sigma*sqrt(T)*z)-K,0); % Option payoff with spot = S - d_S

price = mean(exp(-r*T)*payoff); % Price of option with spot = S
price_Sp = mean(exp(-r*T)*payoff_Sp); % Price of option with spot = S + d_S
price_Sm = mean(exp(-r*T)*payoff_Sm); % Price of option with spot = S - d_S

% Delta
delta = (price_Sp - price_Sm)/(2*d_S) 
[CallVal, PutVal] = blsdelta(80, 100, 0.10, 1, 0.30, 0.03); 
% Gamma
gamma = (price_Sp - 2*price + price_Sm)/(d_S^2) 
blsgamma(80, 100, 0.10, 1, 0.30, 0.03); 

