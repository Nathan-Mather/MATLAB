/*  nate mather
 */
 
// Variable specification
var P I K itc q;

varexo eps1;

// Parameter specification
parameters rho sig t_k theta alpha r_bar delta_bar A r delta itc_ss;

// Model parameter assignment
rho = .9;
sig = sqrt(.25);
t_k = 0;
theta = 1;
alpha = .5;
r_bar = .04;
delta_bar = .2;
A = 1;
r = (1/4)*r_bar;
delta = (1/4)*delta_bar; // Steady state assignment 
itc_ss = 0;



// Model specification
model;
itc = (1-rho)*itc_ss + rho*itc(-1) + eps1;
0 = -1*(1-itc)*P + q;
0 = -q(-1) + (1/(1+r))*(alpha*(1+t_k)*K^(alpha-1)+q*(1-delta));
I = A*P^theta;
K(+1) = K*(1-delta) + I;
end;

// Steady states
initval;
P = 1.72;
I = 1.72;
K = 68.86 ;
itc = 0;
q = 1.72;
eps1 = 0;

end;

// Below is model solution by Dynare

// Solving for steady-state
steady;

// Checking stability and determinancy conditions
check;

// Impulse responses
shocks;
var eps1;
periods 1;
values 1;
var eps1 = sig^2;

end;

// Simulations
options_.pruning=1;
stoch_simul(order=3, periods=10000, drop=500);