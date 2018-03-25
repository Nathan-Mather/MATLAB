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

var c k i n y A r w;
varexo e;

parameters alpha beta delta v chi rho sigmae A_ss N_ss K_ss I_ss C_ss Y_ss w_ss r_ss;

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
A_ss   = 1;
N_ss = N_ss_i;
K_ss = K_ss_i;
I_ss = I_ss_i;
C_ss = C_ss_i;
Y_ss = Y_ss_i;
w_ss  = w_ss_i;
r_ss = r_ss_i;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;
exp(c)^(-1) = beta*exp(c(+1))^(-1)*(alpha*exp(A(+1))*((exp(k(+1)))^(alpha - 1))*exp(n(+1))^(1-alpha)+(1-delta));
chi*exp(n)^(1/v) = exp(c)^(-1)*exp(w);
exp(k) = (1-delta)*exp(k(-1)) + exp(i(-1));
exp(c)+exp(i) = exp(A)*exp(k)^(alpha)*exp(n)^(1-alpha);
A = rho*A(-1) + e;
exp(y) = exp(A)*exp(k)^(alpha)*exp(n)^(1-alpha);
exp(w) = (1-alpha)*exp(A)*exp(k)^(alpha)*exp(n)^(-alpha);
exp(r) = alpha*exp(A)*exp(k)^(alpha-1)*exp(n)^(1-alpha);

end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
  k = log(K_ss);
  c = log(C_ss);
  i = log(I_ss);
  n = log(N_ss);
  A = log(A_ss); 
  w = log(w_ss);
  r = log(r_ss);
  y = log(Y_ss);
end;

shocks;
var e = sigmae^2;
end;

steady;

stoch_simul(order=1,irf=40, periods=1000, drop=500);


