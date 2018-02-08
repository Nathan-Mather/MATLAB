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
M_.fname = 'hw2_dynare';
M_.dynare_version = '4.5.3';
oo_.dynare_version = '4.5.3';
options_.dynare_version = '4.5.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('hw2_dynare.log');
M_.exo_names = 'eps1';
M_.exo_names_tex = 'eps1';
M_.exo_names_long = 'eps1';
M_.endo_names = 'P';
M_.endo_names_tex = 'P';
M_.endo_names_long = 'P';
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'itc');
M_.endo_names_tex = char(M_.endo_names_tex, 'itc');
M_.endo_names_long = char(M_.endo_names_long, 'itc');
M_.endo_names = char(M_.endo_names, 'q');
M_.endo_names_tex = char(M_.endo_names_tex, 'q');
M_.endo_names_long = char(M_.endo_names_long, 'q');
M_.endo_partitions = struct();
M_.param_names = 'rho';
M_.param_names_tex = 'rho';
M_.param_names_long = 'rho';
M_.param_names = char(M_.param_names, 'sig');
M_.param_names_tex = char(M_.param_names_tex, 'sig');
M_.param_names_long = char(M_.param_names_long, 'sig');
M_.param_names = char(M_.param_names, 't_k');
M_.param_names_tex = char(M_.param_names_tex, 't\_k');
M_.param_names_long = char(M_.param_names_long, 't_k');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'r_bar');
M_.param_names_tex = char(M_.param_names_tex, 'r\_bar');
M_.param_names_long = char(M_.param_names_long, 'r_bar');
M_.param_names = char(M_.param_names, 'delta_bar');
M_.param_names_tex = char(M_.param_names_tex, 'delta\_bar');
M_.param_names_long = char(M_.param_names_long, 'delta_bar');
M_.param_names = char(M_.param_names, 'A');
M_.param_names_tex = char(M_.param_names_tex, 'A');
M_.param_names_long = char(M_.param_names_long, 'A');
M_.param_names = char(M_.param_names, 'r');
M_.param_names_tex = char(M_.param_names_tex, 'r');
M_.param_names_long = char(M_.param_names_long, 'r');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'itc_ss');
M_.param_names_tex = char(M_.param_names_tex, 'itc\_ss');
M_.param_names_long = char(M_.param_names_long, 'itc_ss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 5;
M_.param_nbr = 11;
M_.orig_endo_nbr = 5;
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
M_.hessian_eq_zero = 0;
erase_compiled_function('hw2_dynare_static');
erase_compiled_function('hw2_dynare_dynamic');
M_.orig_eq_nbr = 5;
M_.eq_nbr = 5;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 0;
 0 5 8;
 1 6 0;
 2 7 0;]';
M_.nstatic = 2;
M_.nfwrd   = 1;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 1;
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
oo_.steady_state = zeros(5, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(11, 1);
M_.NNZDerivatives = [14; 4; 2];
M_.params( 1 ) = .9;
rho = M_.params( 1 );
M_.params( 2 ) = 0.5;
sig = M_.params( 2 );
M_.params( 3 ) = 0;
t_k = M_.params( 3 );
M_.params( 4 ) = 1;
theta = M_.params( 4 );
M_.params( 5 ) = .5;
alpha = M_.params( 5 );
M_.params( 6 ) = .04;
r_bar = M_.params( 6 );
M_.params( 7 ) = .2;
delta_bar = M_.params( 7 );
M_.params( 8 ) = 1;
A = M_.params( 8 );
M_.params( 9 ) = 0.25*M_.params(6);
r = M_.params( 9 );
M_.params( 10 ) = 0.25*M_.params(7);
delta = M_.params( 10 );
M_.params( 11 ) = 0;
itc_ss = M_.params( 11 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 1.72;
oo_.steady_state( 2 ) = 1.72;
oo_.steady_state( 3 ) = 68.86;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 1.72;
oo_.exo_steady_state( 1 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.det_shocks = [ M_.det_shocks;
struct('exo_det',0,'exo_id',1,'multiplicative',0,'periods',1:1,'value',1) ];
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(2)^2;
options_.pruning=1;
options_.k_order_solver = 1;
options_.drop = 500;
options_.order = 3;
options_.periods = 10000;
var_list_ = char();
info = stoch_simul(var_list_);
save('hw2_dynare_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('hw2_dynare_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('hw2_dynare_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('hw2_dynare_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('hw2_dynare_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('hw2_dynare_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('hw2_dynare_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
