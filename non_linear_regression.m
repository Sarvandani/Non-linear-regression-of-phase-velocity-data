clear all
clc
%% Author Sarvandani
%% Non-linear regression of phase velocity data
addpath(fullfile('/Volumes/DRIVE_2/non-linear-regression_github/data/'));
files = dir('/Volumes/DRIVE_2/non-linear-regression_github/data/*.txt');
myFolder = '/Volumes/DRIVE_2/non-linear-regression_github/data/';

data = cell(length(files));   
for ii = 1:length(files)
    data{ii} = load(files(ii).name);
end
data = cat(1,data{:});
%% observed data
x = data(:,1);
y = data(:,2);
plot(x,y,'r.')
xlabel('Period') 
ylabel('Phase velocity') 
grid on
%% regression
x_2=linspace(1,12,100)';
[fitting,S]  = polyfit(x, y, 4);
[yfit,error] = polyval(fitting, x_2,S);
hold on
%% regression plot
plot(x_2, yfit, 'ko-', 'LineWidth', 1.5);
grid on;
xlabel('Period (s)') 
ylabel('Phase velocity (km/s)') 
set(gca,'FontSize',13.0, 'FontWeight','Bold')
hold on
%% Every single txt files plot
d=dir(fullfile(myFolder, '*.txt'));
for k = 1:numel(d)
  data=dlmread(fullfile(d(k).folder,d(k).name));
  plot(data(:,1),data(:,2));
end
