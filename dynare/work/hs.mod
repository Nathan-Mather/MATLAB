/* Hansen and Singleton, Dynare file
 * 2rd order perturbation
 *
 * Econ 607, Chris House
 * Wenting Song 01-17-2017
 */
 
// Variable specification
var d1 d2 c p1 p2 R;

varexo eps1 eps2;

// Parameter specification
parameters rho1 rho2 d1bar d2bar sig1 sig2 sigma beta
d1_ss d2_ss c_ss p1_ss p2_ss R_ss;

// Model parameter assignment
rho1 	= 0.5; 		
d1bar 	= 0.5;
sig1 	= sqrt(0.0075/2);
rho2 	= 0.5; 		
d2bar 	= 0.5;
sig2 	= sqrt(0.0075/2);
sigma 	= 1;  		// Intertemporal rate of substitution
beta 	= 0.96; 	// Discount rate

// Steady state assignment 
d1_ss   = 0.5;
d2_ss   = 0.5;
c_ss    = 1;
p1_ss   = 12;
p2_ss   = 12;
R_ss    = 1.0417;


// Model specification
model;
0 = d1_ss*exp(d1) - (1-rho1)*d1bar - rho1*d1_ss*exp(d1(-1)) - eps1;
0 = d2_ss*exp(d2) - (1-rho2)*d2bar - rho2*d2_ss*exp(d2(-1)) - eps2;
0 = c_ss*exp(c) - d1_ss*exp(d1) - d2_ss*exp(d2);
0 = (c_ss*exp(c))^(-1/sigma) - beta*R_ss*exp(R)*(c_ss*exp(c(+1)))^(-1/sigma);
0 = p1_ss*exp(p1)*(c_ss*exp(c))^(-1/sigma) - beta*(d1_ss*exp(d1(+1))+p1_ss*exp(p1(+1)))*(c_ss*exp(c(+1)))^(-1/sigma);
0 = p2_ss*exp(p2)*(c_ss*exp(c))^(-1/sigma) - beta*(d2_ss*exp(d2(+1))+p2_ss*exp(p2(+1)))*(c_ss*exp(c(+1)))^(-1/sigma);
end;

// Steady states
initval;
d1 		= 0;
d2 		= 0;
R 		= 0;
c 		= 0;
p1		= 0;
p2 		= 0;
end;

// Below is model solution by Dynare

// Solving for steady-state
steady;

// Checking stability and determinancy conditions
check;

// Impulse responses
shocks;
var eps1 = sig1^2;
var eps2 = sig2^2;
end;

// Simulations
stoch_simul(order=2, periods=10000, drop=500);