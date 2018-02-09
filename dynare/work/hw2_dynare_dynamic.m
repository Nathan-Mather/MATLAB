function [residual, g1, g2, g3] = hw2_dynare_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(5, 1);
T38 = 1/(1+params(9));
lhs =y(6);
rhs =(1-params(1))*params(11)+params(1)*y(1)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =0;
rhs =(-(1-y(6)))*params(15)*exp(y(3))+params(14)*exp(y(7));
residual(2)= lhs-rhs;
lhs =0;
rhs =(-params(14))*exp(y(2))+T38*(params(5)*(1-params(3))*(params(12)*exp(y(5)))^(params(5)-1)+params(14)*exp(y(7))*(1-params(10)));
residual(3)= lhs-rhs;
lhs =params(13)*exp(y(4));
rhs =params(15)*params(8)*exp(y(3))^params(4);
residual(4)= lhs-rhs;
lhs =params(12)*exp(y(8));
rhs =params(13)*exp(y(4))+params(12)*exp(y(5))*(1-params(10));
residual(5)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(5, 9);

  %
  % Jacobian matrix
  %

T75 = exp(y(3))*getPowerDeriv(exp(y(3)),params(4),1);
T80 = params(12)*exp(y(5))*getPowerDeriv(params(12)*exp(y(5)),params(5)-1,1);
  g1(1,1)=(-params(1));
  g1(1,6)=1;
  g1(1,9)=(-1);
  g1(2,3)=(-((-(1-y(6)))*params(15)*exp(y(3))));
  g1(2,6)=(-(params(15)*exp(y(3))));
  g1(2,7)=(-(params(14)*exp(y(7))));
  g1(3,5)=(-(T38*params(5)*(1-params(3))*T80));
  g1(3,2)=(-((-params(14))*exp(y(2))));
  g1(3,7)=(-(T38*params(14)*exp(y(7))*(1-params(10))));
  g1(4,3)=(-(params(15)*params(8)*T75));
  g1(4,4)=params(13)*exp(y(4));
  g1(5,4)=(-(params(13)*exp(y(4))));
  g1(5,5)=(-(params(12)*exp(y(5))*(1-params(10))));
  g1(5,8)=params(12)*exp(y(8));

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(12,3);
  v2(1,1)=2;
  v2(1,2)=21;
  v2(1,3)=(-((-(1-y(6)))*params(15)*exp(y(3))));
  v2(2,1)=2;
  v2(2,2)=48;
  v2(2,3)=(-(params(15)*exp(y(3))));
  v2(3,1)=2;
  v2(3,2)=24;
  v2(3,3)=  v2(2,3);
  v2(4,1)=2;
  v2(4,2)=61;
  v2(4,3)=(-(params(14)*exp(y(7))));
  v2(5,1)=3;
  v2(5,2)=41;
  v2(5,3)=(-(T38*params(5)*(1-params(3))*(T80+params(12)*exp(y(5))*params(12)*exp(y(5))*getPowerDeriv(params(12)*exp(y(5)),params(5)-1,2))));
  v2(6,1)=3;
  v2(6,2)=11;
  v2(6,3)=(-((-params(14))*exp(y(2))));
  v2(7,1)=3;
  v2(7,2)=61;
  v2(7,3)=(-(T38*params(14)*exp(y(7))*(1-params(10))));
  v2(8,1)=4;
  v2(8,2)=21;
  v2(8,3)=(-(params(15)*params(8)*(T75+exp(y(3))*exp(y(3))*getPowerDeriv(exp(y(3)),params(4),2))));
  v2(9,1)=4;
  v2(9,2)=31;
  v2(9,3)=params(13)*exp(y(4));
  v2(10,1)=5;
  v2(10,2)=31;
  v2(10,3)=(-(params(13)*exp(y(4))));
  v2(11,1)=5;
  v2(11,2)=41;
  v2(11,3)=(-(params(12)*exp(y(5))*(1-params(10))));
  v2(12,1)=5;
  v2(12,2)=71;
  v2(12,3)=params(12)*exp(y(8));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),5,81);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,729);
end
end
end
end
