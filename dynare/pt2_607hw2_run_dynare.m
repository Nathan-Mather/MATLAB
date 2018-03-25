
clear all; close all;

%% set workind directory
cd C:\Users\Nmath_000\Documents\MATLAB\dynare\work

%% calculate steady states for parms 

% load parms from r code 
parms =  csvread('C:/Users/Nmath_000/Documents/MI_school/macro 607/part 2/hw2_parms.csv', 1)

beta_i = .99
delta_i = .025
alpha_i = (1/3)
v_i = .72
rho_i = parms(1,1)
sigmae_i = parms(1,2)


% find ss values useing n = 1/3
A_ss = 1
N_ss_i = (1/3)
K_ss_i = (((1/beta_i) - (1-delta_i))/alpha_i)^(1/(alpha_i - 1))*N_ss_i
I_ss_i = delta_i*K_ss_i
C_ss_i = (K_ss_i^alpha_i)*(N_ss_i)^(1-alpha_i) - I_ss_i
Y_ss_i = K_ss_i^(alpha_i)*N_ss_i^(1-alpha_i)

r_ss_i = alpha_i*A_ss*(K_ss_i^(alpha_i - 1))*(N_ss_i^alpha_i)
w_ss_i = (1 - alpha_i)*A_ss*(K_ss_i^alpha_i)*(N_ss_i^(alpha_i))



% use equations from paper pencil to find chi_i to target n = 1/3
chi_i = (((1-alpha_i)*K_ss_i^alpha_i)/C_ss_i)*(1/3)^(-1*((1/v_i)+alpha_i))*A_ss



%% Running Dynare simulation

% run 

    dynare pt2_607h2_dynare
    
    % Create a PNG filename.
    fullFileName =  strcat('C:\Users\Nmath_000\Documents\MI_school\macro 607\part 2\plots\pt2_hw2_ir_plot.png')
	
	% Then save it
	saveas(gcf, fullFileName)
    
    % grab data 
    sim_data =  transpose(oo_.endo_simul);
    
    %% doing hp filter stuff 
    
    % set up blank matrix to fill in with data 
    hp_data =  zeros(1000, 8);
  
    % loop over columns of sim_data and run them through the hp filter 
    for i =1:8
        
        % run ith column of sim_data through filter and fill it into ith
        % column of blank matrix 
         hp_data(:,i) = hp_filter(sim_data(:,i), 1600);
         
    end
    
    std(hp_data)
    "c k i n y A r w"
    
    %% redo above with diffent values of v untill std matches 
    v_i = 50000000000000000000000000000000000000000
    
    % use equations from paper pencil to find chi_i to target n = 1/3
   chi_i = (((1-alpha_i)*K_ss_i^alpha_i)/C_ss_i)*(1/3)^(-1*((1/v_i)+alpha_i))*A_ss


   
        dynare pt2_607h2_dynare
        
      % grab data 
    sim_data2 =  transpose(oo_.endo_simul);
    
        % set up blank matrix to fill in with data 
    hp_data2 =  zeros(1000, 8);
    
        % loop over columns of sim_data and run them through the hp filter 
    for i =1:8
        
        % run ith column of sim_data through filter and fill it into ith
        % column of blank matrix 
         hp_data2(:,i) = hp_filter(sim_data2(:,i), 1600);
         
    end
      std2 = std(hp_data2);
      std_n = std2(1,4)

