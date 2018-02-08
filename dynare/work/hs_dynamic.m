function [residual, g1, g2, g3] = hs_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(6, 1);
T50 = (-1)/params(7);
T51 = (params(11)*exp(y(5)))^T50;
T61 = (params(11)*exp(y(11)))^T50;
lhs =0;
rhs =params(9)*exp(y(3))-(1-params(1))*params(3)-params(9)*params(1)*exp(y(1))-x(it_, 1);
residual(1)= lhs-rhs;
lhs =0;
rhs =params(10)*exp(y(4))-(1-params(2))*params(4)-params(10)*params(2)*exp(y(2))-x(it_, 2);
residual(2)= lhs-rhs;
lhs =0;
rhs =params(11)*exp(y(5))-params(9)*exp(y(3))-params(10)*exp(y(4));
residual(3)= lhs-rhs;
lhs =0;
rhs =T51-params(8)*params(14)*exp(y(8))*T61;
residual(4)= lhs-rhs;
lhs =0;
rhs =T51*params(12)*exp(y(6))-T61*params(8)*(params(9)*exp(y(9))+params(12)*exp(y(12)));
residual(5)= lhs-rhs;
lhs =0;
rhs =T51*params(13)*exp(y(7))-T61*params(8)*(params(10)*exp(y(10))+params(13)*exp(y(13)));
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 15);

  %
  % Jacobian matrix
  %

T109 = params(11)*exp(y(5))*getPowerDeriv(params(11)*exp(y(5)),T50,1);
T116 = params(11)*exp(y(11))*getPowerDeriv(params(11)*exp(y(11)),T50,1);
  g1(1,1)=params(9)*params(1)*exp(y(1));
  g1(1,3)=(-(params(9)*exp(y(3))));
  g1(1,14)=1;
  g1(2,2)=params(10)*params(2)*exp(y(2));
  g1(2,4)=(-(params(10)*exp(y(4))));
  g1(2,15)=1;
  g1(3,3)=params(9)*exp(y(3));
  g1(3,4)=params(10)*exp(y(4));
  g1(3,5)=(-(params(11)*exp(y(5))));
  g1(4,5)=(-T109);
  g1(4,11)=params(8)*params(14)*exp(y(8))*T116;
  g1(4,8)=params(8)*params(14)*exp(y(8))*T61;
  g1(5,9)=T61*params(8)*params(9)*exp(y(9));
  g1(5,5)=(-(params(12)*exp(y(6))*T109));
  g1(5,11)=params(8)*(params(9)*exp(y(9))+params(12)*exp(y(12)))*T116;
  g1(5,6)=(-(T51*params(12)*exp(y(6))));
  g1(5,12)=T61*params(8)*params(12)*exp(y(12));
  g1(6,10)=T61*params(8)*params(10)*exp(y(10));
  g1(6,5)=(-(params(13)*exp(y(7))*T109));
  g1(6,11)=params(8)*(params(10)*exp(y(10))+params(13)*exp(y(13)))*T116;
  g1(6,7)=(-(T51*params(13)*exp(y(7))));
  g1(6,13)=T61*params(8)*params(13)*exp(y(13));

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(34,3);
T135 = T109+params(11)*exp(y(5))*params(11)*exp(y(5))*getPowerDeriv(params(11)*exp(y(5)),T50,2);
T140 = T116+params(11)*exp(y(11))*params(11)*exp(y(11))*getPowerDeriv(params(11)*exp(y(11)),T50,2);
  v2(1,1)=1;
  v2(1,2)=1;
  v2(1,3)=params(9)*params(1)*exp(y(1));
  v2(2,1)=1;
  v2(2,2)=33;
  v2(2,3)=(-(params(9)*exp(y(3))));
  v2(3,1)=2;
  v2(3,2)=17;
  v2(3,3)=params(10)*params(2)*exp(y(2));
  v2(4,1)=2;
  v2(4,2)=49;
  v2(4,3)=(-(params(10)*exp(y(4))));
  v2(5,1)=3;
  v2(5,2)=33;
  v2(5,3)=params(9)*exp(y(3));
  v2(6,1)=3;
  v2(6,2)=49;
  v2(6,3)=params(10)*exp(y(4));
  v2(7,1)=3;
  v2(7,2)=65;
  v2(7,3)=(-(params(11)*exp(y(5))));
  v2(8,1)=4;
  v2(8,2)=65;
  v2(8,3)=(-T135);
  v2(9,1)=4;
  v2(9,2)=161;
  v2(9,3)=params(8)*params(14)*exp(y(8))*T140;
  v2(10,1)=4;
  v2(10,2)=116;
  v2(10,3)=params(8)*params(14)*exp(y(8))*T116;
  v2(11,1)=4;
  v2(11,2)=158;
  v2(11,3)=  v2(10,3);
  v2(12,1)=4;
  v2(12,2)=113;
  v2(12,3)=params(8)*params(14)*exp(y(8))*T61;
  v2(13,1)=5;
  v2(13,2)=129;
  v2(13,3)=T61*params(8)*params(9)*exp(y(9));
  v2(14,1)=5;
  v2(14,2)=65;
  v2(14,3)=(-(params(12)*exp(y(6))*T135));
  v2(15,1)=5;
  v2(15,2)=159;
  v2(15,3)=params(8)*params(9)*exp(y(9))*T116;
  v2(16,1)=5;
  v2(16,2)=131;
  v2(16,3)=  v2(15,3);
  v2(17,1)=5;
  v2(17,2)=161;
  v2(17,3)=params(8)*(params(9)*exp(y(9))+params(12)*exp(y(12)))*T140;
  v2(18,1)=5;
  v2(18,2)=80;
  v2(18,3)=(-(params(12)*exp(y(6))*T109));
  v2(19,1)=5;
  v2(19,2)=66;
  v2(19,3)=  v2(18,3);
  v2(20,1)=5;
  v2(20,2)=81;
  v2(20,3)=(-(T51*params(12)*exp(y(6))));
  v2(21,1)=5;
  v2(21,2)=176;
  v2(21,3)=T116*params(8)*params(12)*exp(y(12));
  v2(22,1)=5;
  v2(22,2)=162;
  v2(22,3)=  v2(21,3);
  v2(23,1)=5;
  v2(23,2)=177;
  v2(23,3)=T61*params(8)*params(12)*exp(y(12));
  v2(24,1)=6;
  v2(24,2)=145;
  v2(24,3)=T61*params(8)*params(10)*exp(y(10));
  v2(25,1)=6;
  v2(25,2)=65;
  v2(25,3)=(-(params(13)*exp(y(7))*T135));
  v2(26,1)=6;
  v2(26,2)=160;
  v2(26,3)=params(8)*params(10)*exp(y(10))*T116;
  v2(27,1)=6;
  v2(27,2)=146;
  v2(27,3)=  v2(26,3);
  v2(28,1)=6;
  v2(28,2)=161;
  v2(28,3)=params(8)*(params(10)*exp(y(10))+params(13)*exp(y(13)))*T140;
  v2(29,1)=6;
  v2(29,2)=95;
  v2(29,3)=(-(params(13)*exp(y(7))*T109));
  v2(30,1)=6;
  v2(30,2)=67;
  v2(30,3)=  v2(29,3);
  v2(31,1)=6;
  v2(31,2)=97;
  v2(31,3)=(-(T51*params(13)*exp(y(7))));
  v2(32,1)=6;
  v2(32,2)=191;
  v2(32,3)=T116*params(8)*params(13)*exp(y(13));
  v2(33,1)=6;
  v2(33,2)=163;
  v2(33,3)=  v2(32,3);
  v2(34,1)=6;
  v2(34,2)=193;
  v2(34,3)=T61*params(8)*params(13)*exp(y(13));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),6,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,3375);
end
end
end
end
