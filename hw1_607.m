
% run ar simulation 
Ya = AR_sim(0,.9,.19,100,0)

% make the scatter plot of y over time 
plot_1 = figure
scatter(Ya(:,2),Ya(:,1))

% calculate mean and std dev
mean_a = mean(Ya(:,1))
std_a = std(Ya(:,1))

% scatter of yt vs yt-1 
plot_2 = figure
scatter(Ya(1:99,1),Ya(2:100,1))

% do impulse response function.  
Yb = AR_sim(0,.9,0,100,0.01)

% plot impulse response function
plot_ir_1 = figure
plot(Yb(:,2), Yb(:,1))

% rerun with rho = .5
Yc = AR_sim(0,.5,.19,100,0)

% make the scatter plot of y over time 
plot_3 = figure
scatter(Yc(:,2),Yc(:,1))

% calculate mean and std dev
mean_c = mean(Yc(:,1))
std_c = std(Yc(:,1))

% scatter of yt vs yt-1 
plot_4 = figure
scatter(Yc(1:99,1),Yc(2:100,1))

% do impulse response function.
Yd = AR_sim(0,.5,0,100,0.01)

% plot impulse response function 
plot_ir_2 = figure
plot( Yd(:,2), Yd(:,1))

% save all plots 
saveas(plot_1, "hw_1_plot_1.png")
saveas(plot_2, "hw_1_plot_2.png")
saveas(plot_ir_1, "hw_1_plot_ir_1.png")
saveas(plot_ir_2, "hw_1_plot_ir_2.png")
saveas(plot_3, "hw_1_plot_3.png")
saveas(plot_4, "hw_1_plot_4.png")