
% create list of data sets 
list = ["gdp_ch09_SA", "nondur_ch09_SA", "p_nres_inv_ch09_SA", "res_inv_ch09_SA"];

% initialize a matrix to store variance data in 
std_data = zeros(1,4);

% initialize matrx to store data. Use 76 rows because C and I data doesn't
% go back further. 
full_hp_data = zeros(76,4);

% loop over data sets 
for i = 1:4
    
    % grab charchter string 
    str =  list(i);
    
    % load data
    dt = xlsread(strcat("C:\Users\Nmath_000\Documents\MI_school\macro 607\data\", str, ".xlsx"));

    % log the data 
    dt = log(dt);

    % create vector of row numbers 
    row_num = transpose(1:1:length(dt));

    % add row numbers for plot 
    dt = [dt row_num];

    % make the scatter plot of log data over time 
    plot_1 = figure;
    plot( dt(:,2), dt(:,1))
    title( strcat("Plot of log ",str, " over time"));
    
    % run data through hp filter 
    hp_data = hp_filter(dt(:,1), 1600);

    % add row numbers for plot 
    hp_data = [hp_data row_num];

    % make the scatter plot of log data over time 
    plot_2 = figure;
    plot( hp_data(:,2), hp_data(:,1))
    title(strcat("Plot of HP filtered log ",regexprep(str,"_", " "), " over time") );

    % save plots 
    saveas(plot_1, strcat("C:\Users\Nmath_000\Documents\MATLAB\plots\hw3\hw_3_p1_",str, ".png"))
    saveas(plot_2, strcat("C:\Users\Nmath_000\Documents\MATLAB\plots\hw3\hw_3_p2",str, ".png"))

    % store data NOTE: We have to take the last 76 observations of the data
    % because real consumption and investment only goes back that far. 
    full_hp_data(:, i) = hp_data(length(hp_data)-75:length(hp_data) , 1);
    
    % calculate variance of data 
    std_data(1,i) = std(hp_data(:,1));
  
end

% print off standard deviation of data 
"standard deviation of GDP, nondurable C, non_res I, res I"
"all observations are chained 2009"
std_data

% do correlations 

    % loop over c I columns to correlate with y 
    for i = 2:4 
               
        % grab gdp column and ith column
        lag_data = full_hp_data(:,[1 i]);
        
        % loop 10 times to create backward lags, We could do more but the number of
        % obervations drops off and so they stop being usefull 
        for t = 1:10
           
            % create vector of lagged data backwards 
            lag_t_b = [NaN(t,1); lag_data(1:76-t, 2)];

            % fill in lagged data 
            lag_data(:, t+2) = lag_t_b;
            
        end
        
        
        % loop 10 time to create forward lags 
          for t = 1:10
           
            % create vector of forward data 
            lag_t_f = [lag_data(t+1:76, 2); NaN(t,1) ];

            % fill in lagged data 
            lag_data(:, t+12) = lag_t_f;
            
        end
                    
    
        % now get covariances for the lagged data 
        lagged_correlations = corr(lag_data,'Rows','pairwise');
        
        % grab relavent info 
        lagged_correlations = lagged_correlations(:, 1);
        
        % grab charchter string 
        str =  list(i);
        
        % print backwards lags 
        strcat("backward corr of GDP with ",str) 
        lagged_correlations(2:11,1)
        
        % print forward lags 
        strcat("forward corr of GDP with ",str) 
        lagged_correlations(12:21,1)
        
        
    end


