%% trainScript
%  train a classifier based on Linear regression with multiple variables
%  using the closed loop solution (normal equation=normalEq.m).
%  Ie. No greadientDescent and  No feature scalling
%  NOTE: thetas size is zeors(numberOfFeatures + 1, 1);
%  Unless you have already added the bias term (which you should) in which
%  case you have theta=zeros(numberOfFeatures, 1);
%% Load Data
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');