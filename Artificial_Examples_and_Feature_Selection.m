%% Artificial Examples and Feature Selection
% Christoph Lohrmann, PhD, Pasi Luukka, DSc (Tech)
% Manuscript: "Nonspecificity, strife and total uncertainty in supervised feature selection"
% August, 2020

clear all
close all
clc

%% Example 1: One decision region per class, 2-class problem, moderate overlap for the second feature

% Specifications of the data that is artificially generated
mu(1,:) = [2,5]; % mean (not scaled yet)
sigma(:,:,1) = [0.2 0; 0 0.5]; % covariance matrix (not scaled yet)
mu(2,:) = [7,2]; % mean (not scaled yet)
sigma(:,:,2) = sigma(:,:,1); % covariance matrix (not scaled yet)
class=[1,2]; % class labels corresponding to the means and covariance matrices

% Generation of the artificial data
num=600; % number of observations generated for each group (each mean and covaraince matrix combination)
x = [];
y = [];
for o=1:size(class,2);
temp = mvnrnd(mu(o,:),sigma(:,:,o),num); % generate sampels from a normal distribution (given the means and covariance matrices)
x = [x; temp]; % add data
y = [y; repmat(class(o),num,1)]; % add class labels
end

% Visualization
colours = ({'b','r'});
figure
plot(x(y==1,1),x(y==1,2),'+','Color',colours{1},'MarkerSize',2), hold on
plot(x(y==2,1),x(y==2,2),'.','Color',colours{2},'MarkerSize',5)
grid on
title('First artificial example')

% Scaling and last preparations
x = maxminscal(x); % Scaling into unit interval [0,1]
data = [x, y]; % Combine data with class labels as last column
v = [1:size(x,2)]; % column indices of the data
c = size(x,2)+1; % volum indices of the class label
p = 1; % parameter for similarity

% Calculation of the feature rankings
[rankedNS,I1] = FSnonspecificityPoss(data,v,c,p); % Nonspecificity
[rankedST,I2] = FSstrifePoss(data,v,c,p); % Strife
[rankedTU,I3] = FStotaluncertaintyPoss(data,v,c,p); % Total Uncertainty

% Comment: Higher information transmission values are better (indicative of
% more relevant features) since the uncertainty in for a feature for all
% observations is considerably higher than the uncertainty for the same
% feature only considering observations of each class. 



%% Example 2: Two decision regions per class, 2-class problem, moderate overlap for the second feature
clear mu
clear sigma

% Specifications of the data that is artificially generated
mu(1,:) = [2,2]; % mean (not scaled yet)
sigma(:,:,1) = [0.05 0; 0 0.05]; % covariance matrix (not scaled yet)
mu(2,:) = [5,3.5]; % mean (not scaled yet)
sigma(:,:,2) = [0.3 0; 0 0.3]; % covariance matrix (not scaled yet)
mu(3,:) = [9,5]; % mean (not scaled yet)
sigma(:,:,3) = sigma(:,:,2); % covariance matrix (not scaled yet)
mu(4,:) = [12,6.5]; % mean (not scaled yet)
sigma(:,:,4) = sigma(:,:,1); % covariance matrix (not scaled yet)
class=[1,2,1,2]; % class labels corresponding to the means and covariance matrices


% Generation of the artificial data
num=[300, 600, 600, 300]; % number of observations generated for each group (each mean and covaraince matrix combination)
x = [];
y = [];
for o=1:size(class,2);
temp = mvnrnd(mu(o,:),sigma(:,:,o),num(o)); % generate sampels from a normal distribution (given the means and covariance matrices)
x = [x; temp]; % add data
y = [y; repmat(class(o),num(o),1)]; % add class labels
end

%Visualization
colours=({'b','r'});
figure
plot(x(y==1,1),x(y==1,2),'+','Color',colours{1},'MarkerSize',2), hold on
plot(x(y==2,1),x(y==2,2),'.','Color',colours{2},'MarkerSize',5)
grid on
title('Second artificial example')


% Scaling and last preparations
x = maxminscal(x); % Scaling into unit interval [0,1]
data = [x, y]; % Combine data with class labels as last column
v = [1:size(x,2)]; % column indices of the data
c = size(x,2)+1; % volum indices of the class label
p = 1; % parameter for similarity


% Calculation of the feature rankings
[rankedNS,I1] = FSnonspecificityPoss(data,v,c,p); % Nonspecificity
[rankedST,I2] = FSstrifePoss(data,v,c,p); % Strife
[rankedTU,I3] = FStotaluncertaintyPoss(data,v,c,p); % Total Uncertainty

% Comment: Higher information transmission values are better (indicative of
% more relevant features) since the uncertainty in for a feature for all
% observations is considerably higher than the uncertainty for the same
% feature only considering observations of each class. 

%% Example 3: One decision region per class, 3-class problem, different variance and sample size, small overlap for second feature
clear mu
clear sigma

% Specifications of the data that is artificially generated
mu(1,:) = [2,10]; % mean (not scaled yet)
sigma(:,:,1) = [0.1 0; 0 0.1]; % covariance matrix (not scaled yet)
mu(2,:) = [5,6.5]; % mean (not scaled yet)
sigma(:,:,2) = [0.1 0; 0 0.8]; % covariance matrix (not scaled yet)
mu(3,:) = [10,3]; % mean (not scaled yet)
sigma(:,:,3) = [0.8 0; 0 0.1]; % covariance matrix (not scaled yet)
class=[1,2,3]; % class labels corresponding to the means and covariance matrices


% Generation of the artificial data
num=[300, 600, 600]; % number of observations generated for each group (each mean and covaraince matrix combination)
x = [];
y = [];
for o=1:size(class,2);
temp = mvnrnd(mu(o,:),sigma(:,:,o),num(o)); % generate sampels from a normal distribution (given the means and covariance matrices)
x = [x; temp]; % add data
y = [y; repmat(class(o),num(o),1)]; % add class labels
end


%Visualization
colours=({'b','r','g'});
figure
plot(x(y==1,1),x(y==1,2),'+','Color',colours{1},'MarkerSize',2), hold on
plot(x(y==2,1),x(y==2,2),'.','Color',colours{2},'MarkerSize',5)
plot(x(y==3,1),x(y==3,2),'*','Color',colours{3},'MarkerSize',2)
grid on
title('Third artificial example')


% Scaling and last preparations
x = maxminscal(x); % Scaling into unit interval [0,1]
data = [x, y]; % Combine data with class labels as last column
v = [1:size(x,2)]; % column indices of the data
c = size(x,2)+1; % volum indices of the class label
p = 1; % parameter for similarity


% Calculation of the feature rankings
[rankedNS,I1] = FSnonspecificityPoss(data,v,c,p); % Nonspecificity
[rankedST,I2] = FSstrifePoss(data,v,c,p); % Strife
[rankedTU,I3] = FStotaluncertaintyPoss(data,v,c,p); % Total Uncertainty

% Comment: Higher information transmission values are better (indicative of
% moree relevant features) since the uncertainty in for a feature for all
% observations is considerably higher than the uncertainty for the same
% feature only considering observations of each class. 
