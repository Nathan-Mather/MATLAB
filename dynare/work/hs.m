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
M_.fname = 'hs';
M_.dynare_version = '4.5.3';
oo_.dynare_version = '4.5.3';
options_.dynare_version = '4.5.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('hs.log');
M_.exo_names = 'eps1';
M_.exo_names_tex = 'eps1';
M_.exo_names_long = 'eps1';
M_.exo_names = char(M_.exo_names, 'eps2');
M_.exo_names_tex = char(M_.exo_names_tex, 'eps2');
M_.exo_names_long = char(M_.exo_names_long, 'eps2');
M_.endo_names = 'd1';
M_.endo_names_tex = 'd1';
M_.endo_names_long = 'd1';
M_.endo_names = char(M_.endo_names, 'd2');
M_.endo_names_tex = char(M_.endo_names_tex, 'd2');
M_.endo_names_long = char(M_.endo_names_long, 'd2');
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'p1');
M_.endo_names_tex = char(M_.endo_names_tex, 'p1');
M_.endo_names_long = char(M_.endo_names_long, 'p1');
M_.endo_names = char(M_.endo_names, 'p2');
M_.endo_names_tex = char(M_.endo_names_tex, 'p2');
M_.endo_names_long = char(M_.endo_names_long, 'p2');
M_.endo_names = char(M_.endo_names, 'R');
M_.endo_names_tex = char(M_.endo_names_tex, 'R');
M_.endo_names_long = char(M_.endo_names_long, 'R');
M_.endo_partitions = struct();
M_.param_names = 'rho1';
M_.param_names_tex = 'rho1';
M_.param_names_long = 'rho1';
M_.param_names = char(M_.param_names, 'rho2');
M_.param_names_tex = char(M_.param_names_tex, 'rho2');
M_.param_names_long = char(M_.param_names_long, 'rho2');
M_.param_names = char(M_.param_names, 'd1bar');
M_.param_names_tex = char(M_.param_names_tex, 'd1bar');
M_.param_names_long = char(M_.param_names_long, 'd1bar');
M_.param_names = char(M_.param_names, 'd2bar');
M_.param_names_tex = char(M_.param_names_tex, 'd2bar');
M_.param_names_long = char(M_.param_names_long, 'd2bar');
M_.param_names = char(M_.param_names, 'sig1');
M_.param_names_tex = char(M_.param_names_tex, 'sig1');
M_.param_names_long = char(M_.param_names_long, 'sig1');
M_.param_names = char(M_.param_names, 'sig2');
M_.param_names_tex = char(M_.param_names_tex, 'sig2');
M_.param_names_long = char(M_.param_names_long, 'sig2');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'd1_ss');
M_.param_names_tex = char(M_.param_names_tex, 'd1\_ss');
M_.param_names_long = char(M_.param_names_long, 'd1_ss');
M_.param_names = char(M_.param_names, 'd2_ss');
M_.param_names_tex = char(M_.param_names_tex, 'd2\_ss');
M_.param_names_long = char(M_.param_names_long, 'd2_ss');
M_.param_names = char(M_.param_names, 'c_ss');
M_.param_names_tex = char(M_.param_names_tex, 'c\_ss');
M_.param_names_long = char(M_.param_names_long, 'c_ss');
M_.param_names = char(M_.param_names, 'p1_ss');
M_.param_names_tex = char(M_.param_names_tex, 'p1\_ss');
M_.param_names_long = char(M_.param_names_long, 'p1_ss');
M_.param_names = char(M_.param_names, 'p2_ss');
M_.param_names_tex = char(M_.param_names_tex, 'p2\_ss');
M_.param_names_long = char(M_.param_names_long, 'p2_ss');
M_.param_names = char(M_.param_names, 'R_ss');
M_.param_names_tex = char(M_.param_names_tex, 'R\_ss');
M_.param_names_long = char(M_.param_names_long, 'R_ss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 6;
M_.param_nbr = 14;
M_.orig_endo_nbr = 6;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 0;
erase_compiled_function('hs_static');
erase_compiled_function('hs_dynamic');
M_.orig_eq_nbr = 6;
M_.eq_nbr = 6;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 1 3 9;
 2 4 10;
 0 5 11;
 0 6 12;
 0 7 13;
 0 8 0;]';
M_.nstatic = 1;
M_.nfwrd   = 3;
M_.npred   = 0;
M_.nboth   = 2;
M_.nsfwrd   = 5;
M_.nspred   = 2;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(6, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(14, 1);
M_.NNZDerivatives = [22; 34; -1];
M_.params( 1 ) = 0.5;
rho1 = M_.params( 1 );
M_.params( 3 ) = 0.5;
d1bar = M_.params( 3 );
M_.params( 5 ) = 0.06123724356957945;
sig1 = M_.params( 5 );
M_.params( 2 ) = 0.5;
rho2 = M_.params( 2 );
M_.params( 4 ) = 0.5;
d2bar = M_.params( 4 );
M_.params( 6 ) = 0.06123724356957945;
sig2 = M_.params( 6 );
M_.params( 7 ) = 1;
sigma = M_.params( 7 );
M_.params( 8 ) = 0.96;
beta = M_.params( 8 );
M_.params( 9 ) = 0.5;
d1_ss = M_.params( 9 );
M_.params( 10 ) = 0.5;
d2_ss = M_.params( 10 );
M_.params( 11 ) = 1;
c_ss = M_.params( 11 );
M_.params( 12 ) = 12;
p1_ss = M_.params( 12 );
M_.params( 13 ) = 12;
p2_ss = M_.params( 13 );
M_.params( 14 ) = 1.0417;
R_ss = M_.params( 14 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 5 ) = 0;
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
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(5)^2;
M_.Sigma_e(2, 2) = M_.params(6)^2;
options_.drop = 500;
options_.order = 2;
options_.periods = 10000;
var_list_ = char();
info = stoch_simul(var_list_);
save('hs_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('hs_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('hs_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('hs_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('hs_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('hs_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('hs_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
