% RBC model with depreciation shocks
%
% March 2 2018
%
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c k i n A_t y w r;
varexo e;

parameters alpha beta delta B A rho sigmae;

%----------------------------------------------------------------
% 1. filling in parms 
%----------------------------------------------------------------


alpha = alpha_i;
beta = beta_i;
delta = delta_i;
B = B_i;
A= A_i;
rho = rho_i;
sigmae = sigmae_i;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;
(1/exp(c))=(beta/exp(c(+1)))*(1-delta+exp(r(+1)));

B=exp(w)/exp(c);

exp(k)=exp(k(-1))*(1-delta)+exp(i);

exp(y)=exp(A_t)*exp(k)^alpha*exp(n)^(1-alpha);

exp(y) = exp(c) + exp(i);

A_t = rho*A_t(-1) + e;

exp(w) = (1-alpha)*exp(A_t)*exp(k)^alpha*exp(n)^(-alpha);

exp(r) = alpha*exp(A_t)*exp(k)^(alpha-1)*exp(n)^1-alpha;



end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
  k = log(K_ss);
  c = log(C_ss);
  i = log(I_ss);
  n = log(N_ss);
  A_t = A; 
  e = 0;
end;

shocks;
var e = sigmae^2;
end;

steady;

stoch_simul(order = 2, periods= periods_i,irf=20);


