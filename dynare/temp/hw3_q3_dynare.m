%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'hw3_q3_dynare';
M_.dynare_version = '4.5.3';
oo_.dynare_version = '4.5.3';
options_.dynare_version = '4.5.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('hw3_q3_dynare.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'n');
M_.endo_names_tex = char(M_.endo_names_tex, 'n');
M_.endo_names_long = char(M_.endo_names_long, 'n');
M_.endo_names = char(M_.endo_names, 'd');
M_.endo_names_tex = char(M_.endo_names_tex, 'd');
M_.endo_names_long = char(M_.endo_names_long, 'd');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_partitions = struct();
M_.param_names = 'alpha';
M_.param_names_tex = 'alpha';
M_.param_names_long = 'alpha';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'dbar');
M_.param_names_tex = char(M_.param_names_tex, 'dbar');
M_.param_names_long = char(M_.param_names_long, 'dbar');
M_.param_names = char(M_.param_names, 'neta');
M_.param_names_tex = char(M_.param_names_tex, 'neta');
M_.param_names_long = char(M_.param_names_long, 'neta');
M_.param_names = char(M_.param_names, 'phi');
M_.param_names_tex = char(M_.param_names_tex, 'phi');
M_.param_names_long = char(M_.param_names_long, 'phi');
M_.param_names = char(M_.param_names, 'rho');
M_.param_names_tex = char(M_.param_names_tex, 'rho');
M_.param_names_long = char(M_.param_names_long, 'rho');
M_.param_names = char(M_.param_names, 'sigmae');
M_.param_names_tex = char(M_.param_names_tex, 'sigmae');
M_.param_names_long = char(M_.param_names_long, 'sigmae');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 6;
M_.param_nbr = 7;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('hw3_q3_dynare_static');
erase_compiled_function('hw3_q3_dynare_dynamic');
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 3 9;
 1 4 0;
 0 5 0;
 0 6 0;
 2 7 10;
 0 8 0;]';
M_.nstatic = 3;
M_.nfwrd   = 1;
M_.npred   = 1;
M_.nboth   = 1;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 3;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.NNZDerivatives = [21; -1; -1];
close all;
M_.params( 1 ) = alpha_i;
alpha = M_.params( 1 );
M_.params( 2 ) = beta_i;
beta = M_.params( 2 );
M_.params( 3 ) = dbar_i;
dbar = M_.params( 3 );
M_.params( 4 ) = neta_i;
neta = M_.params( 4 );
M_.params( 5 ) = phi_i;
phi = M_.params( 5 );
M_.params( 6 ) = rho_i;
rho = M_.params( 6 );
M_.params( 7 ) = sigmae_i;
sigmae = M_.params( 7 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 2 ) = log(K_ss);
oo_.steady_state( 1 ) = log(C_ss);
oo_.steady_state( 3 ) = log(I_ss);
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = M_.params(3);
oo_.exo_steady_state( 1 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(7)^2;
steady;
options_.irf = 20;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('hw3_q3_dynare_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('hw3_q3_dynare_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('hw3_q3_dynare_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('hw3_q3_dynare_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('hw3_q3_dynare_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('hw3_q3_dynare_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('hw3_q3_dynare_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
