
% initialize function for AR simulation 
function [Y] = AR_sim(alpha, rho,sig_sq,T,y0)

% initialize vector 
Y= [y0,0]

% start a loop 
for t=1:T;
    % calculate ar process for step t
    temp = [alpha + rho*Y(t,1) + normrnd(0,sqrt(sig_sq)),t]
    
    % put it into the vector of results
    Y = [Y;temp]
    
end;

end

