clear;
close all;
%% 2. Plotting A
x = linspace(0, 0.05, 100);  % 100 points from 0 to 0.05s
f = 60;  % in Hz
phase = 25;  % in degrees
V_0 = 36;  % initial voltage

V = V_0 * sin(2 * pi * f * x + deg2rad(phase)); % Calculate voltage over time

% Plot voltage over time
figure;
plot(x, V, LineWidth=1.5);
title("Voltage vs Time of AC Power Source", FontSize=16);
xlabel("Seconds (s)", FontSize=14);
ylabel("Voltage (V)", FontSize=14);
grid on;

%% 3. Plotting B
data = readtable("MatlabDataFit.xlsx");
data_1 = data.Data_1;
data_2 = data.Data_2;

trendline = polyfit(data_1, data_2, 1); % add linear fit to the data
m = trendline(1); % slope of the trendline
b = trendline(2); % intercept of the trendline
data_1_lin = linspace(min(data_1), max(data_1), 100);
data_2_lin = polyval(trendline, data_1_lin);

figure;
scatter(data_1, data_2, "green", "filled", "d") % scatter plot
hold on;
plot(data_1_lin, data_2_lin, LineWidth=1.5) % best linear fit
title("Example Data Plotting from Excel", FontSize=16)
xlabel("Data_1", FontSize=14);
ylabel("Data_2", FontSize=14);
grid on;

% Equation for the trendline
trendlineEquation = sprintf("y = %.1fx + %.1f", m, b);
text(9, 17, trendlineEquation, FontSize=14)
legend("Original Data", "Trendline", "Location", "Best", "FontSize", 14)

hold off;