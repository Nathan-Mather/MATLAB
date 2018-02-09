function [residual, g1, g2, g3] = hw2_dynare_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 5, 1);

%
% Model equations
%

lhs =y(4);
rhs =(1-params(1))*params(11)+y(4)*params(1)+x(1);
residual(1)= lhs-rhs;
lhs =0;
rhs =(-(1-y(4)))*params(15)*exp(y(1))+params(14)*exp(y(5));
residual(2)= lhs-rhs;
lhs =0;
rhs =exp(y(5))*(-params(14))+1/(1+params(9))*(params(5)*(1-params(3))*(params(12)*exp(y(3)))^(params(5)-1)+params(14)*exp(y(5))*(1-params(10)));
residual(3)= lhs-rhs;
lhs =params(13)*exp(y(2));
rhs =params(15)*params(8)*exp(y(1))^params(4);
residual(4)= lhs-rhs;
lhs =params(12)*exp(y(3));
rhs =params(13)*exp(y(2))+params(12)*exp(y(3))*(1-params(10));
residual(5)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(5, 5);

  %
  % Jacobian matrix
  %

  g1(1,4)=1-params(1);
  g1(2,1)=(-((-(1-y(4)))*params(15)*exp(y(1))));
  g1(2,4)=(-(params(15)*exp(y(1))));
  g1(2,5)=(-(params(14)*exp(y(5))));
  g1(3,3)=(-(1/(1+params(9))*params(5)*(1-params(3))*params(12)*exp(y(3))*getPowerDeriv(params(12)*exp(y(3)),params(5)-1,1)));
  g1(3,5)=(-(exp(y(5))*(-params(14))+1/(1+params(9))*params(14)*exp(y(5))*(1-params(10))));
  g1(4,1)=(-(params(15)*params(8)*exp(y(1))*getPowerDeriv(exp(y(1)),params(4),1)));
  g1(4,2)=params(13)*exp(y(2));
  g1(5,2)=(-(params(13)*exp(y(2))));
  g1(5,3)=params(12)*exp(y(3))-params(12)*exp(y(3))*(1-params(10));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],5,25);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],5,125);
end
end
end
end
