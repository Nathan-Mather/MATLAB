clear

% define parameters 
phi = .5
beta = .996
x = .034
tau = .4
gamma =.399
% note that f(theta) = 2.32*theta^0.5

syms theta
equn = 0 == (theta*(1-beta*(1-x))/(beta*(2.32*theta^0.5)))-1+phi*(1+theta)+(((1-phi)*gamma*(2.32*theta^0.5 - x*theta))/((1-tau)*(x+2.32*theta^0.5)))
sol_theta = solve( equn, theta)

% check answer 
theta = 0.3378
(theta*(1-beta*(1-x))/(beta*(2.32*theta^0.5)))-1+phi*(1+theta)+(((1-phi)*gamma*(2.32*theta^0.5 - x*theta))/((1-tau)*(x+2.32*theta^0.5)))

% leaving z out since I think its random. figure it out later 

% solve for n 
n = 2.32*theta^0.5/(x+ 2.32*theta^0.5)

% xovle vor v 
v = (theta*(1-n))/n

% solve for c 
c = (2.32*theta^0.5 - x*theta)/(2.32*theta^0.5 + x)

% solve for w 
w


= phi*(1+theta) + ((1-phi)*gamma*c)/(1-tau)


