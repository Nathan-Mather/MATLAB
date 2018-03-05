clear all; close all;

%% set workind directory
cd C:\Users\Nmath_000\Documents\MATLAB\dynare\work

%% calculate steady states for parms 
beta_i = .99
delta_i = .025
alpha_i = .35
B_i = 8/3
A_i = 1
rho_i = .95
sigmae_i = .01

r_ss = (1/beta_i)-1+delta_i
K_ss = ((1-alpha_i)/B_i)*A_i*(r_ss/(alpha_i*A_i))^(-alpha_i/(1-alpha_i))*((r_ss/alpha_i)-delta_i)^-1
I_ss = delta_i*K_ss
N_ss = (r_ss/(alpha_i*A_i))^(1/(1-alpha_i))*K_ss
C_ss = ((1-alpha_i)/B_i)*A_i*K_ss^alpha_i*N_ss^-alpha_i

%% Running Dynare simulations
    % run dynare
    dynare hw3_q4_dynare

    % Create a PNG filename.
    fullFileName =  strcat('C:\Users\Nmath_000\Documents\MATLAB\plots\hw3\hw3_q4_ir.png')
		
	% Then save it
	saveas(gcf, fullFileName)
    
    % grab data 
    sim_data =  transpose(oo_.endo_simul)
    
%% doing hp filter stuff 
    
    % set up blank matrix to fill in with data 
    hp_data =  zeros(1000, 8)
  
    % loop over columns of sim_data and run them through the hp filter 
    for i =1:8
        
        % run ith column of sim_data through filter and fill it into ith
        % column of blank matrix 
         hp_data(:,i) = hp_filter(sim_data(:,i), 1600)
         
    end
    
    std(hp_data)
    
    






