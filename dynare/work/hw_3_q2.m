
% create list of data sets 
list = ["gdp_ch09_SA", "nondur_ch09_SA", "p_nres_inv_ch09_SA", "res_inv_ch09_SA"]

for i = 1:4
    
    % grab charchter string 
    str =  list(i)
    
    % run hp filter function 
    dt = xlsread(strcat("C:\Users\Nmath_000\Documents\MI_school\macro 607\data\", str, ".xlsx"))

    % log the data 
    dt = log(dt)

    % create vector of row numbers 
    row_num = transpose(1:1:length(dt))

    % add row numbers for plot 
    dt = [dt row_num]

    % make the scatter plot of log data over time 
    plot_1 = figure
    plot( dt(:,2), dt(:,1))

    % run data through hp filter 
    hp_data = hp_filter(dt(:,1), 1600)

    % add row numbers for plot 
    hp_data = [hp_data row_num]

    % make the scatter plot of log data over time 
    plot_2 = figure
    plot( hp_data(:,2), hp_data(:,1))

    % save plots 
    saveas(plot_1, strcat("C:\Users\Nmath_000\Documents\MATLAB\plots\hw_3_p1_",str, ".png"))
    saveas(plot_2, strcat("C:\Users\Nmath_000\Documents\MATLAB\plots\hw_3_p2",str, ".png"))

end

