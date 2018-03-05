function [residual, g1, g2, g3] = hw3_q4_dynare_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(8, 1);
T41 = exp(y(4))^params(1);
T46 = exp(y(6))^(1-params(1));
T60 = exp(y(6))^(-params(1));
T69 = exp(y(6))*exp(y(7))*params(1)*exp(y(4))^(params(1)-1);
lhs =1/exp(y(3));
rhs =params(2)/exp(y(11))*(1-params(3)+exp(y(12)));
residual(1)= lhs-rhs;
lhs =params(4);
rhs =exp(y(9))/exp(y(3));
residual(2)= lhs-rhs;
lhs =exp(y(4));
rhs =(1-params(3))*exp(y(1))+exp(y(5));
residual(3)= lhs-rhs;
lhs =exp(y(8));
rhs =exp(y(7))*T41*T46;
residual(4)= lhs-rhs;
lhs =exp(y(8));
rhs =exp(y(3))+exp(y(5));
residual(5)= lhs-rhs;
lhs =y(7);
rhs =params(6)*y(2)+x(it_, 1);
residual(6)= lhs-rhs;
lhs =exp(y(9));
rhs =T41*exp(y(7))*(1-params(1))*T60;
residual(7)= lhs-rhs;
lhs =exp(y(10));
rhs =T69-params(1);
residual(8)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(8, 13);

  %
  % Jacobian matrix
  %

T78 = (-((-(exp(y(3))*exp(y(9))))/(exp(y(3))*exp(y(3)))));
T87 = exp(y(4))*getPowerDeriv(exp(y(4)),params(1),1);
T95 = exp(y(4))*getPowerDeriv(exp(y(4)),params(1)-1,1);
T101 = exp(y(6))*getPowerDeriv(exp(y(6)),1-params(1),1);
T105 = exp(y(6))*getPowerDeriv(exp(y(6)),(-params(1)),1);
  g1(1,3)=(-exp(y(3)))/(exp(y(3))*exp(y(3)));
  g1(1,11)=(-((1-params(3)+exp(y(12)))*(-(params(2)*exp(y(11))))/(exp(y(11))*exp(y(11)))));
  g1(1,12)=(-(params(2)/exp(y(11))*exp(y(12))));
  g1(2,3)=T78;
  g1(2,9)=(-(exp(y(9))/exp(y(3))));
  g1(3,1)=(-((1-params(3))*exp(y(1))));
  g1(3,4)=exp(y(4));
  g1(3,5)=(-exp(y(5)));
  g1(4,4)=(-(T46*exp(y(7))*T87));
  g1(4,6)=(-(exp(y(7))*T41*T101));
  g1(4,7)=(-(exp(y(7))*T41*T46));
  g1(4,8)=exp(y(8));
  g1(5,3)=(-exp(y(3)));
  g1(5,5)=(-exp(y(5)));
  g1(5,8)=exp(y(8));
  g1(6,2)=(-params(6));
  g1(6,7)=1;
  g1(6,13)=(-1);
  g1(7,4)=(-(T60*exp(y(7))*(1-params(1))*T87));
  g1(7,6)=(-(T41*exp(y(7))*(1-params(1))*T105));
  g1(7,7)=(-(T41*exp(y(7))*(1-params(1))*T60));
  g1(7,9)=exp(y(9));
  g1(8,4)=(-(exp(y(6))*exp(y(7))*params(1)*T95));
  g1(8,6)=(-T69);
  g1(8,7)=(-T69);
  g1(8,10)=exp(y(10));

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(45,3);
T139 = T87+exp(y(4))*exp(y(4))*getPowerDeriv(exp(y(4)),params(1),2);
  v2(1,1)=1;
  v2(1,2)=29;
  v2(1,3)=((-exp(y(3)))*exp(y(3))*exp(y(3))-(-exp(y(3)))*(exp(y(3))*exp(y(3))+exp(y(3))*exp(y(3))))/(exp(y(3))*exp(y(3))*exp(y(3))*exp(y(3)));
  v2(2,1)=1;
  v2(2,2)=141;
  v2(2,3)=(-((1-params(3)+exp(y(12)))*((-(params(2)*exp(y(11))))*exp(y(11))*exp(y(11))-(-(params(2)*exp(y(11))))*(exp(y(11))*exp(y(11))+exp(y(11))*exp(y(11))))/(exp(y(11))*exp(y(11))*exp(y(11))*exp(y(11)))));
  v2(3,1)=1;
  v2(3,2)=154;
  v2(3,3)=(-(exp(y(12))*(-(params(2)*exp(y(11))))/(exp(y(11))*exp(y(11)))));
  v2(4,1)=1;
  v2(4,2)=142;
  v2(4,3)=  v2(3,3);
  v2(5,1)=1;
  v2(5,2)=155;
  v2(5,3)=(-(params(2)/exp(y(11))*exp(y(12))));
  v2(6,1)=2;
  v2(6,2)=29;
  v2(6,3)=(-((exp(y(3))*exp(y(3))*(-(exp(y(3))*exp(y(9))))-(-(exp(y(3))*exp(y(9))))*(exp(y(3))*exp(y(3))+exp(y(3))*exp(y(3))))/(exp(y(3))*exp(y(3))*exp(y(3))*exp(y(3)))));
  v2(7,1)=2;
  v2(7,2)=107;
  v2(7,3)=T78;
  v2(8,1)=2;
  v2(8,2)=35;
  v2(8,3)=  v2(7,3);
  v2(9,1)=2;
  v2(9,2)=113;
  v2(9,3)=(-(exp(y(9))/exp(y(3))));
  v2(10,1)=3;
  v2(10,2)=1;
  v2(10,3)=(-((1-params(3))*exp(y(1))));
  v2(11,1)=3;
  v2(11,2)=43;
  v2(11,3)=exp(y(4));
  v2(12,1)=3;
  v2(12,2)=57;
  v2(12,3)=(-exp(y(5)));
  v2(13,1)=4;
  v2(13,2)=43;
  v2(13,3)=(-(T46*exp(y(7))*T139));
  v2(14,1)=4;
  v2(14,2)=69;
  v2(14,3)=(-(exp(y(7))*T87*T101));
  v2(15,1)=4;
  v2(15,2)=45;
  v2(15,3)=  v2(14,3);
  v2(16,1)=4;
  v2(16,2)=71;
  v2(16,3)=(-(exp(y(7))*T41*(T101+exp(y(6))*exp(y(6))*getPowerDeriv(exp(y(6)),1-params(1),2))));
  v2(17,1)=4;
  v2(17,2)=82;
  v2(17,3)=(-(T46*exp(y(7))*T87));
  v2(18,1)=4;
  v2(18,2)=46;
  v2(18,3)=  v2(17,3);
  v2(19,1)=4;
  v2(19,2)=84;
  v2(19,3)=(-(exp(y(7))*T41*T101));
  v2(20,1)=4;
  v2(20,2)=72;
  v2(20,3)=  v2(19,3);
  v2(21,1)=4;
  v2(21,2)=85;
  v2(21,3)=(-(exp(y(7))*T41*T46));
  v2(22,1)=4;
  v2(22,2)=99;
  v2(22,3)=exp(y(8));
  v2(23,1)=5;
  v2(23,2)=29;
  v2(23,3)=(-exp(y(3)));
  v2(24,1)=5;
  v2(24,2)=57;
  v2(24,3)=(-exp(y(5)));
  v2(25,1)=5;
  v2(25,2)=99;
  v2(25,3)=exp(y(8));
  v2(26,1)=7;
  v2(26,2)=43;
  v2(26,3)=(-(T60*exp(y(7))*(1-params(1))*T139));
  v2(27,1)=7;
  v2(27,2)=69;
  v2(27,3)=(-(exp(y(7))*(1-params(1))*T87*T105));
  v2(28,1)=7;
  v2(28,2)=45;
  v2(28,3)=  v2(27,3);
  v2(29,1)=7;
  v2(29,2)=71;
  v2(29,3)=(-(T41*exp(y(7))*(1-params(1))*(T105+exp(y(6))*exp(y(6))*getPowerDeriv(exp(y(6)),(-params(1)),2))));
  v2(30,1)=7;
  v2(30,2)=82;
  v2(30,3)=(-(T60*exp(y(7))*(1-params(1))*T87));
  v2(31,1)=7;
  v2(31,2)=46;
  v2(31,3)=  v2(30,3);
  v2(32,1)=7;
  v2(32,2)=84;
  v2(32,3)=(-(T41*exp(y(7))*(1-params(1))*T105));
  v2(33,1)=7;
  v2(33,2)=72;
  v2(33,3)=  v2(32,3);
  v2(34,1)=7;
  v2(34,2)=85;
  v2(34,3)=(-(T41*exp(y(7))*(1-params(1))*T60));
  v2(35,1)=7;
  v2(35,2)=113;
  v2(35,3)=exp(y(9));
  v2(36,1)=8;
  v2(36,2)=43;
  v2(36,3)=(-(exp(y(6))*exp(y(7))*params(1)*(T95+exp(y(4))*exp(y(4))*getPowerDeriv(exp(y(4)),params(1)-1,2))));
  v2(37,1)=8;
  v2(37,2)=69;
  v2(37,3)=(-(exp(y(6))*exp(y(7))*params(1)*T95));
  v2(38,1)=8;
  v2(38,2)=45;
  v2(38,3)=  v2(37,3);
  v2(39,1)=8;
  v2(39,2)=71;
  v2(39,3)=(-T69);
  v2(40,1)=8;
  v2(40,2)=82;
  v2(40,3)=(-(exp(y(6))*exp(y(7))*params(1)*T95));
  v2(41,1)=8;
  v2(41,2)=46;
  v2(41,3)=  v2(40,3);
  v2(42,1)=8;
  v2(42,2)=84;
  v2(42,3)=(-T69);
  v2(43,1)=8;
  v2(43,2)=72;
  v2(43,3)=  v2(42,3);
  v2(44,1)=8;
  v2(44,2)=85;
  v2(44,3)=(-T69);
  v2(45,1)=8;
  v2(45,2)=127;
  v2(45,3)=exp(y(10));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),8,169);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],8,2197);
end
end
end
end
