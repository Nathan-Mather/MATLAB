%% function code 
% create function for HP filter 
function [smooth_data] = hp_filter(y =[1 2 3 4 5 6 2 5 8 9],u = .5) 

    % figure out the length of our unput vector 
    T = length(y)
    
    % create matrix 
    A = zeros(T, T)
    
    % fill in the t= 1,2,T,T-1 rows. 
    A(1,:) = [1+u -2*u u repelem(0,T-3)]
    A(2,:) = [-2*u 1+5*u -4*u u repelem(0,T-4)]
    A(T-1,:) = [repelem(0,T-4) u -4*u 1+5*u -2*u]
    A(T,:) = [repelem(0,T-3) u -2*u 1+u]
    
    % fill in the rest of the rows 
    for t=3:T-2;
        
        A(t,:) = [repelem(0,t-3) u -4*u 1+6*u -4*u u repelem(0,T-t-2)]
        
    end
    
    % now calculate smoothed data 
    s_d = inv(A)*y

end
%%




