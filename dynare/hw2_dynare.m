/*  nate mather
 */
 
// Variable specification
var P I K itc q;

varexo eps1;

// Parameter specification
parameters t_k theta alpha r_bar delta_bar A r delta;

// Model parameter assignment
rho = 1;
sig = sqrt(0.0075/2);
t_k = 0;
theta = 1;
alpha = .5;
r_bar = .04;
delta_bar = .1 ;
A = 1;
r = (1/4)*r_bar;
delta = (1/4)*delta_bar; // Steady state assignment 
itc_ss = 0;



// Model specification
model;
itc = (1-rho)*itc_bar + rho*itc + eps1;
0 = (-(1-itc)*P + q;
0 = -q + (1/(1+r))*(alpha*(1+t_k(+1))*k(+1)^(alpha-1)+q(+1)(1-delta));
end;

// Steady states
initval;
P = 0;
I = 0;
K = 0 ;
itc = 0;
q = 0;
eps1 = 0;

end;

// Below is model solution by Dynare

// Solving for steady-state
steady;

// Checking stability and determinancy conditions
check;

// Impulse responses
shocks;
var eps1 = sig1^2;
end;

// Simulations
stoch_simul(order=2, periods=10000, drop=500);