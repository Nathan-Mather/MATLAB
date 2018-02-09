
clear all; close all;

%% set workind directory
cd C:\Users\Nmath_000\Documents\MATLAB\dynare\work

%% calculate steady states found in HW 

% define variables 
itc = 0 
t_k = 0
theta = 1
alpha = .5
r_bar = .04
delta_bar = .1 
A = 1
r = (1/4)*r_bar
delta = (1/4)*delta_bar 

% calculate values 
P_ss = (delta/A)^((alpha-1)/(theta*(alpha-1)-1))*(((r+delta)*(1-itc))/alpha ...
    *(1-t_k))^(1/(theta*(alpha-1)-1))

I_ss = A*P_ss

K_ss = I_ss/delta

%% Running Dynare simulations for different rho 

% define delta_bar 
delta_bar_i = .2
% run looop over rho 
for rho_i = [.25 .5 .75 .9 1]

    dynare hw2_dynare
    
    % Create a PNG filename.
    pngFileName =  strcat('ir_rho_', num2str(rho_i), '.png')
	fullFileName = fullfile('ir_plots', pngFileName)
		
	% Then save it
	saveas(gcf, fullFileName)
    
end


%% running dynare simulations for different delta 
% define rho
rho_i = .9 

% run loop over delta_bar 
for delta_bar_i = [.2, .1, .05, .02, .01]
    
     dynare hw2_dynare
    
    % Create a PNG filename.
    pngFileName =  strcat('ir_delta_', num2str(delta_bar_i), '.png')
	fullFileName = fullfile('ir_plots', pngFileName)
		
	% Then save it
	saveas(gcf, fullFileName)

end
