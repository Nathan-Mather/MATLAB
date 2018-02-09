/*AR ITC model
 *DYNARE
 *Caitlin Hegarty
 *February 7, 2018
 */

// Variable specification
var i p k itc q;

varexo eps;

// Parameter specification
parameters prho pITCbar pr pdelta palpha ptauk pA ptheta
K_ss I_ss P_ss ITC_ss q_ss;

// Model parameter assignment 
prho = rho;
pITCbar = ITCbar;
pr = r;
pdelta = delta;
palpha = alpha;
ptauk = tauk;
pA = A;
ptheta = theta;

K_ss = Kstar;
I_ss = Istar;
P_ss = Pstar;
q_ss = Pstar;
ITC_ss = ITCstar;

// Model specification
model;
0 = K_ss*exp(k)*(1-pdelta) + I_ss*exp(i) - K_ss*exp(k(+1));
0 = pA*(P_ss*exp(p))^ptheta - I_ss*exp(i);
0 = q_ss*exp(q) - P_ss*exp(p)*(1-itc);
0 = -q_ss*exp(q(-1)) + (1/(1+pr))*((1-ptauk)*palpha*(K_ss*exp(k))^(palpha-1) 
+ q_ss*exp(q)*(1-pdelta));
0 = itc - (1-prho)*pITCbar - prho*itc(-1) - eps;
end;

initval;
itc = 0;
i = 0;
k = 0;
p = 0;
q = 0;
eps = 0;

end;

// Below is model solution by Dynare

// Solving for steady-state
steady;

// Checking stability and determinancy conditions
check;

// Impulse responses
shocks;
var eps = .01;
end;

// Simulations
stoch_simul(order=2, periods=10000, drop=500);
