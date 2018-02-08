function [residual, g1, g2, g3] = hs_static(y, x, params)
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

residual = zeros( 6, 1);

%
% Model equations
%

T47 = (params(11)*exp(y(3)))^((-1)/params(7));
lhs =0;
rhs =params(9)*exp(y(1))-(1-params(1))*params(3)-exp(y(1))*params(9)*params(1)-x(1);
residual(1)= lhs-rhs;
lhs =0;
rhs =params(10)*exp(y(2))-(1-params(2))*params(4)-exp(y(2))*params(10)*params(2)-x(2);
residual(2)= lhs-rhs;
lhs =0;
rhs =params(11)*exp(y(3))-params(9)*exp(y(1))-params(10)*exp(y(2));
residual(3)= lhs-rhs;
lhs =0;
rhs =T47-T47*params(8)*params(14)*exp(y(6));
residual(4)= lhs-rhs;
lhs =0;
rhs =T47*params(12)*exp(y(4))-T47*params(8)*(params(9)*exp(y(1))+params(12)*exp(y(4)));
residual(5)= lhs-rhs;
lhs =0;
rhs =T47*params(13)*exp(y(5))-T47*params(8)*(params(10)*exp(y(2))+params(13)*exp(y(5)));
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

  %
  % Jacobian matrix
  %

T91 = params(11)*exp(y(3))*getPowerDeriv(params(11)*exp(y(3)),(-1)/params(7),1);
  g1(1,1)=(-(params(9)*exp(y(1))-exp(y(1))*params(9)*params(1)));
  g1(2,2)=(-(params(10)*exp(y(2))-exp(y(2))*params(10)*params(2)));
  g1(3,1)=params(9)*exp(y(1));
  g1(3,2)=params(10)*exp(y(2));
  g1(3,3)=(-(params(11)*exp(y(3))));
  g1(4,3)=(-(T91-params(8)*params(14)*exp(y(6))*T91));
  g1(4,6)=T47*params(8)*params(14)*exp(y(6));
  g1(5,1)=T47*params(9)*exp(y(1))*params(8);
  g1(5,3)=(-(params(12)*exp(y(4))*T91-params(8)*(params(9)*exp(y(1))+params(12)*exp(y(4)))*T91));
  g1(5,4)=(-(T47*params(12)*exp(y(4))-T47*params(8)*params(12)*exp(y(4))));
  g1(6,2)=T47*params(10)*exp(y(2))*params(8);
  g1(6,3)=(-(params(13)*exp(y(5))*T91-params(8)*(params(10)*exp(y(2))+params(13)*exp(y(5)))*T91));
  g1(6,5)=(-(T47*params(13)*exp(y(5))-T47*params(8)*params(13)*exp(y(5))));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],6,36);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],6,216);
end
end
end
end
