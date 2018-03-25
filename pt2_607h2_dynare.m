% RBC model with depreciation shocks
%
% March 2 2018
%
%----------------------------------------------------------------
% 0. Housekeeping (close all grachic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c k i n d y;
varexo e;

parameters alpha beta delta v chi rho sigmae;

%----------------------------------------------------------------
% 1. filling in parms 
%----------------------------------------------------------------


alpha = alpha_i;
beta = beta_i;
delta = delta_i;
v = v_i;
chi = chi_i;
rho = rho_i;
sigmae = sigmae_i;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;
exp(c)^(-1) = beta*exp(c(+1))^(-1)*(alpha*exp(k)^(alpha-1)+1-exp(d(+1)));
0 = exp(c)^(-1)*(1-alpha)*exp(k(-1))^(alpha)*exp(n)^(-alpha)-chi*exp(n)^(1/v);
exp(k) = (1-exp(d))*exp(k(-1)) + exp(i);
exp(c)+exp(i) = exp(k(-1))^(alpha)*exp(n)^(1-alpha);
d = rho*d(-1) + e;
exp(y) = exp(k(-1))^(alpha)*exp(n)^(1-alpha);
end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
  k = log(K_ss);
  c = log(C_ss);
  i = log(I_ss);
  n = log(1);
  d = delta; 
  e = 0;
end;

shocks;
var e = sigmae^2;
end;

steady;

stoch_simul(order = 2,irf=20);


