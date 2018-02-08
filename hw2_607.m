% clear values
clear

% define variables 
itc = 0 
t_k = 0
theta = 1
alpha = .5
r_bar = .04
delta_bar = .1 
A = 1
r = (1/4)*r_bar
delta = (1/4)*delta_bar 

% calculate values 
p = (delta/A)^((alpha-1)/(theta*(alpha-1)-1))*(((r+delta)*(1-itc))/alpha ...
    *(1+t_k))^(1/(theta*(alpha-1)-1))

I = A*p

k = I/delta



