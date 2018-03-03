/*  nate mather
 */
 
// Variable specification
var P I K itc q;

varexo eps1;

// Parameter specification
parameters rho sig t_k theta alpha r_bar delta_bar A r delta itc_ss K_ss I_ss q_ss P_ss;

// Model parameter assignment
rho = rho_i;
sig = .01;
t_k = 0;
theta = 1;
alpha = .5;
r_bar = .04;
delta_bar = delta_bar_i;
A = 1;
r = (1/4)*r_bar;
delta = (1/4)*delta_bar; // Steady state assignment 
itc_ss = 0;
K_ss = 68.8612;
I_ss = 1.7215;
q_ss = 1.7215;
P_ss = 1.7215;



// Model specification
model;
itc = (1-rho)*itc_ss + rho*itc(-1) + eps1;
0 = -1*(1-itc)*P_ss*exp(P) + q_ss*exp(q);
0 = -q_ss*exp(q(-1)) + (1/(1+r))*(alpha*(1-t_k)*(K_ss*exp(K))^(alpha-1)+(q_ss*exp(q))*(1-delta));
I_ss*exp(I) = A*P_ss*exp(P)^theta;
K_ss*exp(K(+1)) = K_ss*exp(K)*(1-delta) + I_ss*exp(I);
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
var eps1 = sig^2;
end;

// Simulations
stoch_simul(order=2, periods=10000, drop=500);