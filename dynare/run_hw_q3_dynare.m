clear all; close all;

%% set workind directory
cd C:\Users\Nmath_000\Documents\MATLAB\dynare\work

%% calculate steady states for parms 
beta_i = .99
dbar_i = .025
alpha_i = .35
neta_i = .5
phi_i = .2886
rho_i = .95
sigmae_i = .01

K_ss = (((1/beta_i) - (1-dbar_i))/alpha_i)^(1/(alpha_i - 1))
I_ss = dbar_i*K_ss
C_ss = K_ss^alpha_i - I_ss


%% Running Dynare simulations for different rho 

% run looop over rho 
for rho_i = [.95 .25]

    dynare hw3_q3_dynare
    
    % Create a PNG filename.
    fullFileName =  strcat('C:\Users\Nmath_000\Documents\MATLAB\plots\hw3_q3_ir_rho_', num2str(rho_i), '.png')
	
		
	% Then save it
	saveas(gcf, fullFileName)
    
end
